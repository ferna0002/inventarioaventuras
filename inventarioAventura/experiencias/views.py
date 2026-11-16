
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction, IntegrityError
from django.utils import timezone
from functools import wraps

from experiencias.models import Categoria, gestion_actividades, Reserva
from cuentas.models import Perfil


# VERIFICAR LOS ROLES DE LOS USUARIOS
def tiene_rol(user, roles):
    if not user.is_authenticated:
        return False

    if user.is_superuser:
        return True

    try:
        return user.perfil.rol in roles
    except Perfil.DoesNotExist:
        return False


# PROTEGER LAS VISTAS SEGUN EL ROL
def requiere_rol(*roles):
    def decorador(vista):
        @wraps(vista)
        @login_required
        def funcion(request, *args, **kwargs):
            if not tiene_rol(request.user, roles):
                messages.error(
                    request,
                    'No tienes permisos para acceder a esta sección.'
                )
                return redirect('inicio')

            return vista(request, *args, **kwargs)

        return funcion
    return decorador


# VERIFICAR SI EL USUARIO PUEDE ADMINISTRAR UNA ACTIVIDAD
def puede_administrar_actividad(user, actividad):
    if user.is_superuser:
        return True

    if tiene_rol(user, ['administrador']):
        return True

    return actividad.usuario_creador_id == user.id


# VISTAS DE CATEGORIAS (ADMIN)

# LISTAR CATEGORIAS
@requiere_rol('administrador')
def categoria_list(request):
    categorias = Categoria.objects.all().order_by('nombre')

    return render(
        request,
        'experiencias/categoria_list.html',
        {'categorias': categorias}
    )


# CREAR CATEGORIA
@requiere_rol('administrador')
def crear_categoria(request):
    if request.method == 'POST':
        nombre = request.POST.get('nombre', '').strip()
        descripcion = request.POST.get('descripcion', '').strip()
        estado = request.POST.get('estado') == 'True'

        if not nombre or not descripcion:
            messages.error(request, 'Completa todos los campos.')

        elif Categoria.objects.filter(nombre__iexact=nombre).exists():
            messages.error(request, 'Ya existe una categoría con ese nombre.')

        else:
            Categoria.objects.create(
                nombre=nombre,
                descripcion=descripcion,
                estado=estado
            )

            messages.success(
                request,
                'La categoría se creó correctamente.'
            )

            return redirect('categoria_list')

    return render(
        request,
        'experiencias/crear_categoria.html'
    )


# EDITAR CATEGORIA
@requiere_rol('administrador')
def editar_categoria(request, id):
    categoria = get_object_or_404(Categoria, id=id)

    if request.method == 'POST':
        nombre = request.POST.get('nombre', '').strip()
        descripcion = request.POST.get('descripcion', '').strip()
        estado = request.POST.get('estado') == 'True'

        if not nombre or not descripcion:
            messages.error(request, 'Completa todos los campos.')

        elif Categoria.objects.filter(
            nombre__iexact=nombre
        ).exclude(id=categoria.id).exists():
            messages.error(
                request,
                'Ya existe otra categoría con ese nombre.'
            )

        else:
            categoria.nombre = nombre
            categoria.descripcion = descripcion
            categoria.estado = estado
            categoria.save()

            messages.success(
                request,
                'La categoría se actualizó correctamente.'
            )

            return redirect('categoria_list')

    return render(
        request,
        'experiencias/editar_categoria.html',
        {'categoria': categoria}
    )


# ELIMINAR CATEGORIA
@requiere_rol('administrador')
def eliminar_categoria(request, id):
    categoria = get_object_or_404(Categoria, id=id)

    if request.method == 'POST':
        tiene_actividades = gestion_actividades.objects.filter(
            categoria=categoria
        ).exists()

        if tiene_actividades:
            messages.error(
                request,
                'No puedes eliminar esta categoría porque tiene '
                'actividades asociadas. Cambia primero esas actividades '
                'a otra categoría.'
            )
        else:
            categoria.delete()

            messages.success(
                request,
                'La categoría se eliminó correctamente.'
            )

    return redirect('categoria_list')


# VISTAS DE ACTIVIDADES
# LISTAR ACTIVIDADES (ADMIN Y GUIA)
@requiere_rol('administrador', 'guia')
def gestion_actividades_list(request):
    if request.user.is_superuser or tiene_rol(
        request.user, ['administrador']
    ):
        experiencias = gestion_actividades.objects.all().order_by('titulo')
    else:
        experiencias = gestion_actividades.objects.filter(
            usuario_creador=request.user
        ).order_by('titulo')

    return render(
        request,
        'experiencias/admin/gestion_actividades_list.html',
        {'actividades': experiencias}
    )


# CREAR ACTIVIDADES
@requiere_rol('administrador', 'guia')
def crear_actividades(request):
    if request.method == 'POST':
        titulo = request.POST.get('titulo')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')
        cupo_maximo = request.POST.get('cupo_maximo')
        fecha_hora = request.POST.get('fecha_hora')
        categoria_id = request.POST.get('categoria')

        if not all([
            titulo, descripcion, precio,
            cupo_maximo, fecha_hora, categoria_id
        ]):
            messages.error(request, 'Completa todos los campos.')

        else:
            categoria = get_object_or_404(
                Categoria,
                id=categoria_id,
                estado=True
            )

            actividad = gestion_actividades(
                titulo=titulo,
                descripcion=descripcion,
                precio=precio,
                cupo_maximo=cupo_maximo,
                fecha_hora=fecha_hora,
                categoria=categoria,
                usuario_creador=request.user
            )

            actividad.save()

            messages.success(
                request,
                'La actividad se creó correctamente.'
            )

            return redirect('actividades_user')

    categorias = Categoria.objects.filter(estado=True)

    return render(
        request,
        'experiencias/admin/crear_actividades.html',
        {'categorias': categorias}
    )


# EDITAR ACTIVIDADES
@requiere_rol('administrador', 'guia')
def editar_actividad(request, id):
    actividad = get_object_or_404(
        gestion_actividades,
        id=id
    )

    if not puede_administrar_actividad(request.user, actividad):
        messages.error(
            request,
            'No tienes permiso para editar esta actividad.'
        )
        return redirect('actividades_user')

    if request.method == 'POST':
        titulo = request.POST.get('titulo')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')
        cupo_maximo = request.POST.get('cupo_maximo')
        fecha_hora = request.POST.get('fecha_hora')
        categoria_id = request.POST.get('categoria')

        if not all([
            titulo, descripcion, precio,
            cupo_maximo, fecha_hora, categoria_id
        ]):
            messages.error(request, 'Completa todos los campos.')

        else:
            categoria = get_object_or_404(
                Categoria,
                id=categoria_id,
                estado=True
            )

            actividad.titulo = titulo
            actividad.descripcion = descripcion
            actividad.precio = precio
            actividad.cupo_maximo = cupo_maximo
            actividad.fecha_hora = fecha_hora
            actividad.categoria = categoria

            actividad.save()

            messages.success(
                request,
                'La actividad se actualizó correctamente.'
            )

            return redirect('gestion_actividades_list')

    categorias = Categoria.objects.filter(estado=True)

    return render(
        request,
        'experiencias/admin/editar_actividad.html',
        {
            'actividad': actividad,
            'categorias': categorias
        }
    )


# ELIMINAR ACTIVIDADES (ADMIN)

@requiere_rol('administrador')
def eliminar_actividad(request, id):
    actividad = get_object_or_404(
        gestion_actividades,
        id=id
    )

    if request.method == 'POST':
        actividad.delete()

        messages.success(
            request,
            'La actividad se eliminó correctamente.'
        )

    return redirect('gestion_actividades_list')


# VISTA PUBLICA DE EXPERIENCIAS

def actividades(request):
    # Administrador ve todas las experiencias
    if request.user.is_superuser or tiene_rol(
        request.user, ['administrador']
    ):
        experiencias = gestion_actividades.objects.all()

    # El guía entra directamente a su listado de gestión:
    # solo ve lo que creó y desde aquí puede editarlo.
    elif tiene_rol(request.user, ['guia']):
        experiencias = gestion_actividades.objects.filter(
            usuario_creador=request.user
        ).order_by('titulo')

        return render(
            request,
            'experiencias/admin/gestion_actividades_list.html',
            {'actividades': experiencias, 'vista_guia': True}
        )

    # Turistas y visitantes ven las experiencias activas
    else:
        experiencias = gestion_actividades.objects.filter(
            categoria__estado=True
        )

    puede_crear = tiene_rol(
        request.user,
        ['administrador', 'guia']
    )

    return render(
        request,
        'experiencias/usuario/actividades.html',
        {
            'experiencias': experiencias,
            'puede_crear': puede_crear
        }
    )

# RESERVAR EXPERIENCIA (TURISTAS)

@login_required(login_url='iniciar_sesion')
def reservar_actividad(request, id):

    if request.method != 'POST':
        return redirect('actividades_user')

    if request.user.is_superuser or not tiene_rol(
        request.user, ['turista']
    ):
        messages.error(
            request,
            'Solo los turistas pueden realizar reservas.'
        )
        return redirect('actividades_user')

    actividad = get_object_or_404(
        gestion_actividades,
        id=id,
        categoria__estado=True
    )

    if actividad.fecha_hora <= timezone.now():
        messages.error(request, 'Esta experiencia ya pasó.')
        return redirect('actividades_user')

    if Reserva.objects.filter(
        usuario=request.user,
        actividad=actividad
    ).exists():
        messages.warning(
            request,
            'Ya tienes una reserva para esta experiencia.'
        )
        return redirect('mis_reservas')

    try:
        with transaction.atomic():

            reservas_actuales = Reserva.objects.filter(
                actividad=actividad
            ).count()

            if reservas_actuales >= actividad.cupo_maximo:
                messages.error(
                    request,
                    'No quedan cupos disponibles.'
                )
                return redirect('actividades_user')

            Reserva.objects.create(
                usuario=request.user,
                actividad=actividad,
                estado_pago='pendiente'
            )

    except IntegrityError:
        messages.warning(
            request,
            'Ya tienes una reserva para esta experiencia.'
        )
        return redirect('mis_reservas')

    messages.success(
        request,
        '¡Tu reserva se realizó correctamente! El pago está pendiente.'
    )

    return redirect('mis_reservas')


# HISTORIAL DE RESERVAS (TURISTA)

@requiere_rol('turista')
def mis_reservas(request):

    reservas = Reserva.objects.filter(
        usuario=request.user
    ).select_related(
        'actividad',
        'actividad__categoria'
    ).order_by('-fecha_reserva')

    return render(
        request,
        'experiencias/usuario/mis_reservas.html',
        {'reservas': reservas}
    )


# TODAS LAS RESERVAS (ADMIN)

@requiere_rol('administrador')
def todas_las_reservas(request):

    reservas = Reserva.objects.select_related(
        'usuario',
        'actividad',
        'actividad__categoria'
    ).order_by('-fecha_reserva')

    return render(
        request,
        'experiencias/admin/reservas_list.html',
        {'reservas': reservas}
    )


# INFORMAR PAGO (TURISTA)

@requiere_rol('turista')
def informar_pago(request, id):
    if request.method != 'POST':
        return redirect('mis_reservas')

    reserva = get_object_or_404(
        Reserva,
        id=id,
        usuario=request.user
    )

    if reserva.estado_pago == 'confirmado':
        messages.info(
            request,
            'Este pago ya fue confirmado por el administrador.'
        )
    elif reserva.estado_pago == 'por_verificar':
        messages.info(
            request,
            'Tu pago ya fue informado y está pendiente de revisión.'
        )
    else:
        reserva.estado_pago = 'por_verificar'
        reserva.save(update_fields=['estado_pago'])
        messages.success(
            request,
            'Informaste tu pago. El administrador debe revisarlo.'
        )

    return redirect('mis_reservas')


# CONFIRMAR PAGO (ADMIN)

@requiere_rol('administrador')
def confirmar_pago(request, id):
    if request.method != 'POST':
        return redirect('todas_las_reservas')

    reserva = get_object_or_404(Reserva, id=id)

    if reserva.estado_pago == 'por_verificar':
        reserva.estado_pago = 'confirmado'
        reserva.save(update_fields=['estado_pago'])
        messages.success(request, 'El pago fue confirmado correctamente.')
    else:
        messages.warning(
            request,
            'Solo puedes confirmar pagos informados por el cliente.'
        )

    return redirect('todas_las_reservas')
