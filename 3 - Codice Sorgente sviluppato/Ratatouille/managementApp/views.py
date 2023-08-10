from django.shortcuts import get_object_or_404, render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from managementApp.models import Dish, Notification
from managementApp.serializers import DishSerializer, IngredientsInDishSerializer
from managementApp.models import Orders
from managementApp.serializers import OrdersSerializer
from managementApp.models import DishesOfOrder
from managementApp.serializers import DishesOfOrderSerializer
from managementApp.models import Ingredients
from managementApp.serializers import IngredientsSerializer

from django.db.models import F

# TODO : TEST

# Getting every ingredients info
@csrf_exempt
def ingredientsAPI(request, identifier):
    if request.methdo == 'GET':
        ingredients = Ingredients.objects.all()
        ingredients_serializer=IngredientsSerializer(ingredients, many=True) 
        return JsonResponse (ingredients_serializer.data, safe=False)
    
    elif request.method == 'PUT': # This update works probably giving already the new value 
        data = JSONParser().parse(request)
        ingredients = Ingredients.objects.get(id=data['id']) 
        serializer = IngredientsSerializer(ingredients, data=data) 
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Updated successfully", safe=False)
        return JsonResponse("Failed to update", safe=False)

    elif request.method  == 'POST':
        data = JSONParser().parse(request) # taking the table number
        serializer = IngredientsSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Added successfully", safe=False)
        return JsonResponse("Failed to add", safe=False)

    elif request.method == 'DELETE':
        Ingredients.objects.get(id=identifier).delete()
        return JsonResponse("Deleted sucessfully", safe=False )

# Creation, Update and delete of a dish, also getting every dish info 
@csrf_exempt
def dishAPI(request, identifier=0):
    if request.methdo == 'GET':
        dishes = Dish.objects.all()
        dishes_serializer=DishSerializer(dishes, many=True) 
        return JsonResponse (dishes_serializer.data, safe=False)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = DishSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Added successfully", safe=False)
        return JsonResponse("Failed to add", safe=False)
    
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        dishes = Dish.objects.get(id=data['id']) 
        serializer = DishSerializer(dishes, data=data) 
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Updated successfully", safe=False)
        return JsonResponse("Failed to update", safe=False)

    elif request.method == 'DELETE':
        Dish.objects.get(id=identifier).delete()
        return JsonResponse("Deleted sucessfully", safe=False )

# Creation, closure and retriving of an order
@csrf_exempt
def orderAPI(request):
        # This case is for when the supervisors need to see the order info aka receipt
        if request.method == 'GET':
            # Take the tableNumber from the body of the request, take the only active order of that table
            # then it takes every dishes of order related with that order
            data = JSONParser().parse(request)
            order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)
            dishes_of_order = DishesOfOrder.objects.filter(orderId=order)
            
            # Take every dish id of that order, then sum the costs
            dish_ids = [dish_of_order.dishId.id for dish_of_order in dishes_of_order]
            dishes = Dish.objects.filter(id__in=dish_ids)
            total_cost = sum(dish.cost for dish in dishes)
            # Update the 'cost' field and save the updated order
            order.cost = total_cost  
            order.save()

            # For each dish, i take the infos and i append them in the list
            dish_data = []
            for dish in dishes:
                dish_serializer = DishSerializer(dish)
                dish_data.append({
                    "dish": dish_serializer.data
                })      
            serializer=OrdersSerializer(order)
            
            return JsonResponse({"order": serializer.data,"dishes": dish_data})
        
        # This case is for the creation of an order, it must be done before adding any dish to the order 
        elif request.method == 'POST':
            data = JSONParser().parse(request) # taking the table number
            serializer = OrdersSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse("Added successfully", safe=False)
            return JsonResponse("Failed to add", safe=False)

        # This case is for when the order ended, and we need to close it 
        # BEFORE DOING THIS, IS A MUST TO TAKE THE ORDER-DISH INFO,
        #  because after isActive=False and if request.method == 'GET': does not work
        elif request.method == 'PUT':
            data = JSONParser().parse(request)  # taking the table number
            order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)
            order.isActive = False
            serializer = OrdersSerializer(order, data=data) 
            if serializer.is_valid():
                serializer.save()
                return JsonResponse("Updated successfully", safe=False)
            return JsonResponse("Failed to update", safe=False)

# Add a tuple (this is for adding an element to an order)
@csrf_exempt
def dishOfOrderAPI(request):
    if request.method == 'POST':
        data = JSONParser().parse(request) # taking the table number and dish id TODO give dish id ?
        order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)

        dish_of_order = DishesOfOrder(orderId=order, dishId=data['dishId'])
        if dish_of_order.is_valid():
            dish_of_order.save()
            return JsonResponse("Added successfully", safe=False)
        return JsonResponse("Failed to add", safe=False)


# Add a tuple (this is for adding an ingredient to a dish)
@csrf_exempt
def ingredientsInDishAPI(request):
        if request.method == 'POST':
            data = JSONParser().parse(request)
        
            serializer = IngredientsInDishSerializer(data=data)
        
            if serializer.is_valid():
                serializer.save()
                return JsonResponse("Added successfully", safe=False)
            return JsonResponse("Failed to add", safe=False)

# The name 
def check_inventory_thresholds():
    ingredients_below_threshold = Ingredients.objects.filter(quantity__lt=F('minTheshold'))

    for ingredient in ingredients_below_threshold:
        message = f"Warning: {ingredient.name} quantity is below threshold ({ingredient.minThreshold})"
        Notification(message=message, ingredient=ingredient.name).save()

# TODO : Gli ordini sono solo gli "scontrini" e l'informazione se sono ancora attivi, una volta che l'ordine è finito, non è più attivo
# un tavolo sta venendo usato se c'è un ordine attivo su di esso.
# Quindi si devno aggiungere tuple alla tabella DishesOfOrder per aggiungere un piatto ad un ordine. Alla chiusura del 
# ordine si dovrà calcolare il valore / oppure qunado lo si vuole stampare in pdf 