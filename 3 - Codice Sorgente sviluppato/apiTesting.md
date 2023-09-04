## Statistics
```
REQUEST
GET http://127.0.0.1:8000/statistics/
{
    "start":"2000-01-01",
    "end":"2100-01-01"
}

RESPONSE
{
    "total": 350.0,
    "Expected value of receipt": 116.0,
    "Expected value of total": 350.0
}
```

## Ingredients
```
REQUEST
GET http://127.0.0.1:8000/ingredients/
NO JSON

RESPONSE
[
    {
        "id": 1,
        "name": "Burro",
        "description": "Burro",
        "quantity": 10.0,
        "cost": 4.48,
        "isAllergen": false,
        "minThreshold": 1
    }
]
```

```
REQUEST
PUT http://127.0.0.1:8000/ingredients/
{
    "id":"1",
    "name":"Burro",
    "description":"Burro",
    "quantity":"10",
    "cost":"4.52",
    "isAllergen":"False",
    "minThreshold":"1"
}

RESPONSE
"Updated successfully"
```

```
REQUEST
POST http://127.0.0.1:8000/ingredients/
{
    "name":"Burro",
    "description":"Burro",
    "quantity":"10",
    "cost":"4.48",
    "isAllergen":"False",
    "minThreshold":"1"
}

RESPONSE
"Added successfully"
```

```
REQUEST
DELETE http://127.0.0.1:8000/ingredients/
{
    "id":"2"
}

RESPONSE
"Deleted sucessfully"
```
