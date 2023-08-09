from django.db import models

# Create your models here.
class Receipt(models.Model):
    id = models.AutoField(primary_key=True)
    # list of dishes ? 
    #table = models.IntegerField()
    
    value = models.FloatField()
    date = models.DateField()