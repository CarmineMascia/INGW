from django.urls import re_path, path
from usersApp import views

urlpatterns = [
    path('user/', views.userApi),
    path('login/', views.login_view),
    path('userget/', views.userGet),
    path('updatePassword/', views.updatePassword_view),
]