from django import forms
from .models import Categoria, gestion_actividades

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nombre', 'descripcion', 'estado']

class ActividadForm(forms.ModelForm):
    class Meta:
        model = gestion_actividades
        fields = ['titulo', 'descripcion', 'precio', 'cupo_maximo', 'fecha_hora', 'categoria', 'usuario_creador']