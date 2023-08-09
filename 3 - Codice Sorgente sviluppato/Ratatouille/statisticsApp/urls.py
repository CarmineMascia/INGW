from django.urls import re_path
from statisticsApp import views

urlpatterns = [
    re_path(r'^statistics/$', views.receiptApi, name='statistics'),
    re_path(r'^statistics/(?P<startDate>\d{4}-\d{2}-\d{2})/(?P<endDate>\d{4}-\d{2}-\d{2})/$', views.receiptApi, name='statistics'),
]