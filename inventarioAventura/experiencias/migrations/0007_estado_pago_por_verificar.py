from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('experiencias', '0006_reserva'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reserva',
            name='estado_pago',
            field=models.CharField(
                choices=[
                    ('pendiente', 'Pendiente'),
                    ('por_verificar', 'Pago informado - por verificar'),
                    ('confirmado', 'Confirmado'),
                ],
                default='pendiente',
                max_length=20,
            ),
        ),
    ]
