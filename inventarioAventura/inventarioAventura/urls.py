
from django.contrib import admin
from django.urls import path, include
from core.views import inicio

urlpatterns = [
    path('admin/', admin.site.urls),

    # Página principal
    path('', inicio, name='inicio'),

    # Aplicación de experiencias
    path('', include('experiencias.urls')),

    # Aplicación de cuentas
    path('cuentas/', include('cuentas.urls')),
]
