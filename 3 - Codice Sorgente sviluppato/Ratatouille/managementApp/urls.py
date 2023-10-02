from django.urls import path
from managementApp import views

urlpatterns = [
    path('statistics/', views.statisticsAPI),
    path('ingredients/', views.ingredientsAPI),
    path('dish/', views.dishAPI),
    path('order/', views.orderAPI),
    path('dishOfOrder/', views.dishOfOrderAPI),
    path('ingredientsInDish/', views.ingredientsInDishAPI),
    path('notification/', views.notificationAPI),
    path('ingredientsInDish/', views.ingredientsInDishAPI)
]