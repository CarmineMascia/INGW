from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from managementApp.models import Dish
from managementApp.serializers import DishSerializer
from managementApp.models import Orders
from managementApp.serializers import OrdersSerializer

# TODO : TEST

# Creation, Update and delete of a dish
@csrf_exempt
def dishAPI(request, identifier=0):
    if request.method == 'POST':
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
        user = Dish.objects.get(id=identifier).delete()
        user.delete()
        return JsonResponse("Deleted sucessfully", safe=False )

# Creation, closure and retriving of an order
@csrf_exempt
def orderAPI(request):
        if request.method == 'GET':
            data = JSONParser().parse(request) 
            order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)
            serializer=OrdersSerializer(order) 
            return JsonResponse (serializer.data, safe=False)
        
        elif request.method == 'POST':
            data = JSONParser().parse(request) 
            serializer = OrdersSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse("Added successfully", safe=False)
            return JsonResponse("Failed to add", safe=False)

        elif request.method == 'PUT':
            data = JSONParser().parse(request)
            order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)
            order.isActive = False
            serializer = OrdersSerializer(order, data=data) 
            if serializer.is_valid():
                serializer.save()
                return JsonResponse("Updated successfully", safe=False)
            return JsonResponse("Failed to update", safe=False)
        
# TODO : Gli ordini sono solo gli "scontrini" e l'informazione se sono ancora attivi, una volta che l'ordine è finito, non è più attivo
# un tavolo sta venendo usato se c'è un ordine attivo su di esso.
# Quindi si devno aggiungere tuple alla tabella DishesOfOrder per aggiungere un piatto ad un ordine. Alla chiusura del 
# ordine si dovrà calcolare il valore / oppure qunado lo si vuole stampare in pdf 