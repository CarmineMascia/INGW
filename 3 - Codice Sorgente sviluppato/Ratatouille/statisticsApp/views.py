from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from statisticsApp.models import Receipt
from statisticsApp.serializers import ReceiptSerializer

from datetime import datetime # AAAA - MM - GG

# Create your views here.
@csrf_exempt
def receiptApi(request, startDate=datetime(2000,1,1), endDate=datetime(2100, 1, 1)):
    if request.method == 'GET':
        receipt_data = Receipt.objects.filter(date__range=(startDate, endDate)).order_by('date')

        total = 0
        for receipt in receipt_data: total += receipt.value

        return JsonResponse({ 
            "total": total, 
            "Expected value of receipt": total // len(receipt_data),
            "Expected value of total": total // (receipt_data.last().date-receipt_data.first().date).days
        })

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = ReceiptSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Added successfully", safe=False)
        return JsonResponse("Failed to add", safe=False)