
from django.db import models
from django.contrib.auth.models import User


class Perfil(models.Model):

    ROLES = [
        ('administrador', 'Administrador'),
        ('guia', 'Guía u Operador'),
        ('turista', 'Turista o Cliente'),
    ]

    usuario = models.OneToOneField(
        User,
        on_delete=models.CASCADE
    )

    rol = models.CharField(
        max_length=20,
        choices=ROLES,
        default='turista'
    )

    def __str__(self):
        return f"{self.usuario.username} - {self.get_rol_display()}"
