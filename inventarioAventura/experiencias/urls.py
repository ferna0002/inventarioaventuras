
from django.urls import path
from . import views

urlpatterns = [
    # ACTIVIDADES
    path('actividades_user/', views.actividades, name='actividades_user'),

    # GESTION DE CATEGORIAS
    path('gestion/categorias/', views.categoria_list, name='categoria_list'),

    path('gestion/categorias/crear/', views.crear_categoria, name='crear_categoria'),

    path('gestion/categorias/editar/<int:id>/', views.editar_categoria, name='editar_categoria'),

    path('gestion/categorias/eliminar/<int:id>/', views.eliminar_categoria, name='eliminar_categoria'),

    # GESTION DE ACTIVIDADES
    path('gestion/actividades/', views.gestion_actividades_list, name='gestion_actividades_list'),

    path('gestion/crear/', views.crear_actividades, name='crear_actividades'),

    path('gestion/editar/<int:id>/', views.editar_actividad, name='editar_actividad'),

    path('gestion/eliminar/<int:id>/', views.eliminar_actividad, name='eliminar_actividad'),

    # RESERVAS
    path('reservar/<int:id>/', views.reservar_actividad, name='reservar_actividad'),

    path('mis_reservas/', views.mis_reservas, name='mis_reservas'),

    path('gestion/reservas/', views.todas_las_reservas, name='todas_las_reservas'),

    # CONFIRMACION DE PAGOS
    path('mis_reservas/<int:id>/informar-pago/', views.informar_pago, name='informar_pago'),

    path('gestion/reservas/<int:id>/confirmar-pago/', views.confirmar_pago, name='confirmar_pago'),
]
