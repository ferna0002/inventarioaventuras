from django.shortcuts import render
from experiencias.models import gestion_actividades


def inicio(request):
    experiencias = gestion_actividades.objects.all()

    return render(request, 'index.html', {'experiencias': experiencias})
