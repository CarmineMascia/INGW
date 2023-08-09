from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from usersApp.models import User
from usersApp.serializers import UserSerializer
 
# Create your views here.
@csrf_exempt
def userApi(request):
    if request.method == 'GET':
        users = User.objects.all()
        user_serializer=UserSerializer(users, many=True) 
        return JsonResponse (user_serializer.data, safe=False)
    
    elif request.method == 'POST':
        user_data = JSONParser().parse(request)
        user_serializer = UserSerializer(data=user_data)
        if user_serializer.is_valid():
            user_serializer.save()
            return JsonResponse("Added successfully", safe=False)
        return JsonResponse("Failed to add", safe=False)

# Login 
@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        data = JSONParser().parse(request)
        name = data.get('name')
        password = data.get('password')
        user = User.objects.filter(name=name, password=password).first()
        if user is not None:
            serializer = UserSerializer(user)
            return JsonResponse(serializer.data, safe=False)
        return JsonResponse("Wrong credential", safe=False)

# Update password
@csrf_exempt
def updatePassword_view(request):
    # TODO check if the new password is not the same as before tu tu tu tu tu tututu
    if request.method == 'PUT':
        data = JSONParser().parse(request)
        user = User.objects.get(id=data['id'])
        serializer = UserSerializer(user, data=data) 
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Updated successfully", safe=False)
        return JsonResponse("Failed to update", safe=False)