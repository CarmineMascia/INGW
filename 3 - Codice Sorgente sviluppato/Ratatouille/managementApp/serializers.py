from rest_framework import serializers
from managementApp.models import Categories
from managementApp.models import Dish
from managementApp.models import Ingredients
from managementApp.models import IngredientsInDish
from managementApp.models import Orders
from managementApp.models import DishesOfOrder
from managementApp.models import Notification

class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categories
        fields = ('id', 'name')

class DishSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dish
        fields = ('id', 'name', 'cost', 'category', 'description')

class IngredientsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredients 
        fields = ('id', 'name', 'description', 'quantity', 'cost', 'isAllergen', 'minThreshold')

class IngredientsInDishSerializer(serializers.ModelSerializer):
    class Meta:
        model = IngredientsInDish 
        fields = ('id', 'dishId', 'ingredientsId', 'quantityNeeded')

class OrdersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Orders
        fields = ('id', 'tableNumber', 'timestamp', 'cost', 'isActive')

class DishesOfOrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = DishesOfOrder
        fields = ('id', 'orderId', 'dishId')

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification 
        fields = ('id', 'message', 'ingredient')
