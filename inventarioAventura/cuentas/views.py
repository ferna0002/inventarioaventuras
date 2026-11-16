
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from .models import Perfil


def registro(request):

    if request.method == 'POST':

        username = request.POST.get('username', '').strip()
        email = request.POST.get('email', '').strip()
        password = request.POST.get('password', '')
        rol = request.POST.get('rol', '')

        # Validar campos vacíos
        if not username or not email or not password:
            messages.error(request, 'Todos los campos son obligatorios.')
            return redirect('registro')

        # Validar nombre de usuario
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Este nombre de usuario ya existe.')
            return redirect('registro')

        # Validar correo electrónico
        if User.objects.filter(email__iexact=email).exists():
            messages.error(request, 'Este correo ya está registrado.')
            return redirect('registro')

        # Validar rol
        if rol not in ['guia', 'turista']:
            messages.error(request, 'Selecciona un rol válido.')
            return redirect('registro')

        # Validar contraseña
        usuario_temporal = User(
            username=username,
            email=email
        )

        try:
            validate_password(password, user=usuario_temporal)
        except ValidationError as error:
            for mensaje in error.messages:
                messages.error(request, mensaje)
            return redirect('registro')

        # Crear usuario y perfil
        with transaction.atomic():

            usuario = User.objects.create_user(
                username=username,
                email=email,
                password=password
            )

            Perfil.objects.create(
                usuario=usuario,
                rol=rol
            )

        messages.success(
            request,
            'Registro exitoso. Ahora puedes iniciar sesión.'
        )

        return redirect('iniciar_sesion')

    return render(request, 'cuentas/registro.html')


def iniciar_sesion(request):

    if request.method == 'POST':

        username = request.POST.get('username', '').strip()
        password = request.POST.get('password', '')

        usuario = authenticate(
            request,
            username=username,
            password=password
        )

        if usuario is not None:

            login(request, usuario)

            messages.success(
                request,
                f'Bienvenido, {usuario.username}.'
            )

            return redirect('inicio')

        messages.error(
            request,
            'Usuario o contraseña incorrectos.'
        )

    return render(request, 'cuentas/iniciar_sesion.html')


def cerrar_sesion(request):

    logout(request)

    messages.success(request, 'Has cerrado sesión correctamente.')

    return redirect('inicio')


@login_required
def gestion_usuarios(request):

    # Comprobar que sea administrador
    es_administrador = request.user.is_superuser

    if not es_administrador:
        try:
            es_administrador = request.user.perfil.rol == 'administrador'
        except Perfil.DoesNotExist:
            es_administrador = False

    if not es_administrador:
        messages.error(
            request,
            'No tienes permisos para gestionar usuarios.'
        )
        return redirect('inicio')

    if request.method == 'POST':

        usuario_id = request.POST.get('usuario_id')
        accion = request.POST.get('accion')

        usuario_objetivo = get_object_or_404(User, id=usuario_id)

        # Proteger la cuenta propia y las cuentas superadministradoras
        if usuario_objetivo == request.user or usuario_objetivo.is_superuser:
            messages.error(
                request,
                'No puedes modificar esta cuenta desde esta sección.'
            )
            return redirect('gestion_usuarios')

        if accion == 'cambiar_rol':

            nuevo_rol = request.POST.get('rol')

            roles_validos = ['administrador', 'guia', 'turista']

            if nuevo_rol not in roles_validos:
                messages.error(request, 'El rol seleccionado no es válido.')
            else:
                perfil, creado = Perfil.objects.get_or_create(
                    usuario=usuario_objetivo,
                    defaults={'rol': 'turista'}
                )

                perfil.rol = nuevo_rol
                perfil.save()

                messages.success(
                    request,
                    'Rol actualizado correctamente.'
                )

        elif accion == 'cambiar_estado':

            usuario_objetivo.is_active = not usuario_objetivo.is_active
            usuario_objetivo.save()

            messages.success(
                request,
                'Estado del usuario actualizado.'
            )

        else:
            messages.error(request, 'La acción solicitada no es válida.')

        return redirect('gestion_usuarios')

    usuarios = User.objects.select_related('perfil').order_by('username')

    return render(
        request,
        'cuentas/gestion_usuarios.html',
        {'usuarios': usuarios}
    )
