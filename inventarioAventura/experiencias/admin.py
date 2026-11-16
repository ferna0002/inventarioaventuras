
from django.contrib import admin

from experiencias.models import (
    gestion_actividades,
    Categoria,
    Reserva
)


# ADMINISTRACION DE CATEGORIAS
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion', 'estado')
    list_filter = ('estado',)
    search_fields = ('nombre',)


# ADMINISTRACION DE ACTIVIDADES
class gestion_actividadesAdmin(admin.ModelAdmin):
    list_display = (
        'titulo',
        'precio',
        'cupo_maximo',
        'fecha_hora',
        'usuario_creador'
    )

    list_filter = ('categoria', 'fecha_hora')
    search_fields = ('titulo', 'descripcion')


# ADMINISTRACION DE RESERVAS
class ReservaAdmin(admin.ModelAdmin):
    list_display = (
        'usuario',
        'actividad',
        'fecha_reserva',
        'estado_pago'
    )

    list_filter = ('estado_pago', 'fecha_reserva')
    search_fields = (
        'usuario__username',
        'actividad__titulo'
    )


# REGISTRO DE MODELOS
admin.site.register(gestion_actividades, gestion_actividadesAdmin)
admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Reserva, ReservaAdmin)
