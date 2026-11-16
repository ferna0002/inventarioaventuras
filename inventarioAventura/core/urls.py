from django.urls import path
from . import views

urlpatterns = [
    path('panel/', views.panel, name='panel'),
    path('panel/administrador/', views.panel_administrador, name='panel_administrador'),
    path('panel/guia/', views.panel_guia, name='panel_guia'),
    path('panel/cliente/', views.panel_turista, name='panel_turista'),
]
