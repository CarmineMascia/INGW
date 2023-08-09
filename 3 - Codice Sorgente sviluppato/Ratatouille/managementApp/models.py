from django.db import models
from django.utils import timezone

# Create your models here.
class Categories(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)

class Dish(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    cost = models.FloatField()
    category = models.ForeignKey(Categories, on_delete=models.CASCADE)
    description = models.CharField(max_length=255)

class Ingredients(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    descripion = models.CharField(max_length=500)
    quantity = models.FloatField() # in kg
    cost = models.FloatField() # for kg
    isAllergen = models.BooleanField(default=False)
    minTheshold = models.IntegerField()

class IngredientsInDish(models.Model):
    id = models.AutoField(primary_key=True)
    dishId = models.ForeignKey(Dish, on_delete=models.CASCADE)
    ingredientsId = models.ForeignKey(Ingredients, on_delete=models.CASCADE)
    quantityNeeded = models.FloatField(default=0.0)

class Orders(models.Model):
    id = models.AutoField(primary_key=True)
    tableNumber = models.IntegerField()
    timestamp = models.DateField(default=timezone.now)
    cost = models.FloatField(default=0.0) # optional
    isActive = models.BooleanField(default=True)

class DishesOfOrder(models.Model):
    id = models.AutoField(primary_key=True)
    orderId = models.ForeignKey(Orders, on_delete=models.CASCADE)
    dishId = models.ForeignKey(Dish, on_delete=models.CASCADE)

class Notification(models.Model):
    id = models.AutoField(primary_key=True)
    message = models.CharField(max_length=500)
    ingredient = models.ForeignKey(Ingredients, on_delete=models.CASCADE)
