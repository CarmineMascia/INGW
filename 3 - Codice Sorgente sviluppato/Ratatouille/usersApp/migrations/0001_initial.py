# Generated by Django 4.2.6 on 2023-10-21 10:22

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('isNew', models.BooleanField(default=True)),
                ('role', models.CharField(choices=[('admin', 'Admin'), ('supervisore', 'Supervisore'), ('chef', 'Chef'), ('cucina', 'Cucina'), ('sala', 'Sala')], max_length=20)),
                ('nome', models.CharField(max_length=100)),
                ('cognome', models.CharField(max_length=100)),
            ],
        ),
    ]