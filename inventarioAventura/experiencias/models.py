
from django.db import models

# Create your models here.

class Categoria(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    estado = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.nombre} - {self.descripcion} - {self.estado}"


class gestion_actividades(models.Model):
    titulo = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cupo_maximo = models.IntegerField()
    fecha_hora = models.DateTimeField()
    categoria = models.ForeignKey('experiencias.Categoria', on_delete=models.CASCADE)
    usuario_creador = models.ForeignKey('auth.User', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.titulo} - {self.descripcion} - ${self.precio} - {self.cupo_maximo} - {self.fecha_hora}"


class crear_actividades(models.Model):
    titulo = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cupo_maximo = models.IntegerField()
    fecha_hora = models.DateTimeField()
    categoria = models.ForeignKey('experiencias.Categoria', on_delete=models.CASCADE)
    usuario_creador = models.ForeignKey('auth.User', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.titulo} - {self.descripcion} - ${self.precio} - {self.cupo_maximo} - {self.fecha_hora}"


class Reserva(models.Model):
    ESTADOS_PAGO = [
        ('pendiente', 'Pendiente'),
        ('por_verificar', 'Pago informado - por verificar'),
        ('confirmado', 'Confirmado'),
    ]

    usuario = models.ForeignKey(
        'auth.User',
        on_delete=models.CASCADE,
        related_name='reservas'
    )

    actividad = models.ForeignKey(
        'experiencias.gestion_actividades',
        on_delete=models.CASCADE,
        related_name='reservas'
    )

    fecha_reserva = models.DateTimeField(auto_now_add=True)

    estado_pago = models.CharField(
        max_length=20,
        choices=ESTADOS_PAGO,
        default='pendiente'
    )

    class Meta:
        unique_together = ('usuario', 'actividad')
        verbose_name = 'Reserva'
        verbose_name_plural = 'Reservas'
        ordering = ['-fecha_reserva']

    def __str__(self):
        return f"{self.usuario.username} - {self.actividad.titulo}"
