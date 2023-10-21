from rest_framework import serializers
from usersApp.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'password', 'isNew', 'role','nome','cognome')