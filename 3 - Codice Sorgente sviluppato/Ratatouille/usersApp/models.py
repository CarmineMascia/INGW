from django.db import models

class User(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    isNew = models.BooleanField(default=True)
    ROLE_CHOICES = [
        ('admin', 'Admin'),
        ('supervisore', 'Supervisore'),
        ('chef', 'Chef'),
        ('cucina', 'Cucina'),
        ('sala', 'Sala'),
    ]
    role = models.CharField(max_length=20, choices=ROLE_CHOICES)
    nome = models.CharField(max_length=100)
    cognome = models.CharField(max_length=100)