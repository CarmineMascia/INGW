from rest_framework import serializers
from statisticsApp.models import Receipt

class ReceiptSerializer(serializers.ModelSerializer):
    class Meta:
        model = Receipt
        fields = ('id', 'value', 'date')