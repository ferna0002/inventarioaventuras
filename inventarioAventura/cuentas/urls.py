
from django.urls import path
from . import views

urlpatterns = [
    path('registro/', views.registro, name='registro'),
    path('iniciar-sesion/', views.iniciar_sesion, name='iniciar_sesion'),
    path('cerrar-sesion/', views.cerrar_sesion, name='cerrar_sesion'),

    # Gestión de usuarios (solo administrador)
    path('gestion-usuarios/', views.gestion_usuarios, name='gestion_usuarios'),
]
