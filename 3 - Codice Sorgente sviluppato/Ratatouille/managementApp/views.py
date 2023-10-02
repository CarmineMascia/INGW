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
from managementApp.models import IngredientsInDish
from managementApp.serializers import NotificationSerializer

from django.db.models import F

from django.db.models import Sum


@csrf_exempt
def statisticsAPI(request):
    if request.method == 'POST':
        data = JSONParser().parse(request)
        startDate = data.get('start')
        endDate = data.get('end')

        receipt_data = Orders.objects.filter(timestamp__range=(startDate, endDate)).order_by('timestamp')
        total = 0
        daily_gains = []  # Lista per tenere traccia dei guadagni giornalieri

        for receipt in receipt_data:
            total += receipt.cost
            daily_gains.append({"data": receipt.timestamp.strftime('%Y-%m-%d'), "guadagno": receipt.cost})

        n = len(receipt_data)
        m = (receipt_data.last().timestamp - receipt_data.first().timestamp).days

        if n == 0: n = 1
        if m == 0: m = 1

        expectedReceipt = total // n
        expectedTotal = total // m

        response = {
            "total": total,
            "Expected value of receipt": expectedReceipt,
            "Expected value of total": expectedTotal,
            "guadagno giornaliero": daily_gains  # Aggiungiamo la lista di guadagni giornalieri
        }

        return JsonResponse(response)
        
@csrf_exempt
def ingredientsAPI(request):
    if request.method == 'GET':
        ingredients = Ingredients.objects.all()
        ingredients_serializer=IngredientsSerializer(ingredients, many=True) 
        return JsonResponse (ingredients_serializer.data, safe=False)
    
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        ingredients = Ingredients.objects.get(id=data['id']) 
        serializer = IngredientsSerializer(ingredients, data=data) 
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Updated successfully", safe=False)
        return JsonResponse("Failed to update", safe=False)

    elif request.method  == 'POST':
        data = JSONParser().parse(request)
        serializer = IngredientsSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Added successfully", safe=False)
        return JsonResponse("Failed to add", safe=False)

    elif request.method == 'DELETE':
        data = JSONParser().parse(request)
        Ingredients.objects.get(id=data['id']).delete()
        return JsonResponse("Deleted sucessfully", safe=False )

@csrf_exempt
def dishAPI(request):
    if request.method == 'GET':
        dishes = Dish.objects.all()
        dishes_serializer=DishSerializer(dishes, many=True) 
        return JsonResponse(dishes_serializer.data, safe=False)

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
        data = JSONParser().parse(request)
        Dish.objects.get(id=data['id']).delete()
        return JsonResponse("Deleted sucessfully", safe=False )

# Creation, closure and retriving of an order
@csrf_exempt
def orderAPI(request):
        # This case is for when the supervisors need to see the order info aka receipt
        if request.method == 'GET':
            data = JSONParser().parse(request)
            table_number = data['tableNumber']

            # Find the active order for the given table number
            order = Orders.objects.get(tableNumber=table_number, isActive=True)

            # Find all dishes associated with this order
            dishes_of_order = DishesOfOrder.objects.filter(orderId=order)

            # Calculate the total cost of all dishes
            total_cost = sum(dish_order.dishId.cost for dish_order in dishes_of_order)

            # Update the 'cost' field of the order
            order.cost = total_cost
            order.save()

            # Create a list to hold the serialized dish data
            dish_data = []

            for dish_order in dishes_of_order:
                dish = dish_order.dishId

                # Serialize the dish
                dish_serializer = DishSerializer(dish)

                # Include the 'count' attribute from the DishesOfOrder model
                dish_data.append({
                    "dish": dish_serializer.data,
                    "count": dish_order.count  # Include the count
                })

            # Serialize the order
            order_serializer = OrdersSerializer(order)

            return JsonResponse({
                "order": order_serializer.data,
                "dishes": dish_data
            })
            
        
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
        # because after isActive=False and if request.method == 'GET': does not work
        elif request.method == 'PUT':
            data = JSONParser().parse(request)  # taking the table number
            order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)
            order.isActive = False
            serializer = OrdersSerializer(order, data=data) 
            if serializer.is_valid():
                serializer.save()
                return JsonResponse("Updated successfully", safe=False)
            return JsonResponse("Failed to update", safe=False)

# The name 
def check_inventory_thresholds():
    ingredients_below_threshold = Ingredients.objects.filter(quantity__lt=F('minTheshold'))

    for ingredient in ingredients_below_threshold:
        message = f"Warning: {ingredient.name} quantity is below threshold ({ingredient.minThreshold})"
        Notification(message=message, ingredient=ingredient.name).save()

# Add a tuple (this is for adding an element to an order)
@csrf_exempt
def dishOfOrderAPI(request):
    if request.method == 'POST':
        data = JSONParser().parse(request)
        try:
            order = Orders.objects.get(tableNumber=data['tableNumber'], isActive=True)
            dish = Dish.objects.get(id=data['dishId'])
        except:
            return JsonResponse({'Failed to add, order or dish not found'}, safe=False)
        
        # Check if a tuple with the same orderId and dishId exists
        existing_dish_of_order = DishesOfOrder.objects.filter(orderId=order, dishId=dish).first()
        
        if existing_dish_of_order:
        # If it exists, increment the count
            existing_dish_of_order.count += 1
            existing_dish_of_order.save()
        else:
            # If it doesn't exist, create a new tuple
            new_dish_of_order = DishesOfOrder(orderId=order, dishId=dish, count=1)
            new_dish_of_order.save()

        ingredients_used = IngredientsInDish.objects.filter(dishId=data['dishId'])
        for ingredient in ingredients_used:
            x = Ingredients.objects.get(id=ingredient.ingredientsId.id)
            x.quantity -= ingredient.quantityNeeded
            x.save()

        return JsonResponse("Added successfully", safe=False)

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

@csrf_exempt
def notificationAPI(request):
    if request.method == 'GET':
        notifications = Notification.objects.all()
        serializer = NotificationSerializer(notifications, many=True)
    
        notification_count = notifications.count()

        response_data = {
            'notifications': serializer.data,
            'notification_count': notification_count,
        }

        return JsonResponse(response_data, safe=False)

@csrf_exempt
def ingredientsInDishAPI(request):
        if request.method == 'GET':
            data = JSONParser().parse(request)
            dish_id = data.get('dishId')

            # Retrieve the dish from the database
            dish = Dish.objects.get(id=dish_id)

            # Retrieve the ingredients IDs related to the dish
            ingredients_in_dish = IngredientsInDish.objects.filter(dishId=dish)

            # Get the IDs of the ingredients
            ingredient_ids = [ingredient.ingredientsId_id for ingredient in ingredients_in_dish]

            # Retrieve the ingredient details based on the IDs
            ingredients = Ingredients.objects.filter(id__in=ingredient_ids)

            # Serialize the ingredients
            ingredient_data = IngredientsSerializer(ingredients, many=True).data

            return JsonResponse({"ingredients": ingredient_data})

# TODO : Gli ordini sono solo gli "scontrini" e l'informazione se sono ancora attivi, una volta che l'ordine è finito, non è più attivo
# un tavolo sta venendo usato se c'è un ordine attivo su di esso.
# Quindi si devno aggiungere tuple alla tabella DishesOfOrder per aggiungere un piatto ad un ordine. Alla chiusura del 
# ordine si dovrà calcolare il valore / oppure qunado lo si vuole stampare in pdf 