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

## Dish
```
REQUEST
GET http://127.0.0.1:8000/dish/
NO JSON

RESPONSE
[
    {
        "id": 1,
        "name": "Tagliatelle in una delicata crema di latticini e formaggio",
        "cost": 16.5,
        "category": 1,
        "description": "Pasta al burro"
    }
]
```

```
REQUEST
POST http://127.0.0.1:8000/dish/
{
    "name":"Tagliatelle in una delicata crema di latticini e formaggio",
    "cost":"15",
    "description":"Pasta al burro",
    "category":"1"
}

RESPONSE
"Added successfully"
```

```
REQUEST
PUT http://127.0.0.1:8000/dish/
{
    "id":"1",
    "name":"Tagliatelle in una delicata crema di latticini e formaggio",
    "cost":"16.5",
    "description":"Pasta al burro",
    "category":"1"
}

RESPONSE
"Updated successfully"
```

```
REQUEST
DELETE http://127.0.0.1:8000/dish/
{
    "id":"2"
}

RESPONSE
"Deleted sucessfully"
```

## Order
```
REQUEST
GET http://127.0.0.1:8000/order/
{
    "tableNumber":"1"
}

RESPONSE
{
    "order": {
        "id": 4,
        "tableNumber": 1,
        "timestamp": "2023-09-05",
        "cost": 16.5,
        "isActive": true
    },
    "dishes": [
        {
            "dish": {
                "id": 1,
                "name": "Tagliatelle in una delicata crema di latticini e formaggio",
                "cost": 16.5,
                "category": 1,
                "description": "Pasta al burro"
            }
        }
    ]
}
```

```
REQUEST
POST http://127.0.0.1:8000/order/
{
    "tableNumber":"1"
}

RESPONSE
"Added successfully"
```

```
REQUEST
PUT http://127.0.0.1:8000/order/
{
    "tableNumber":"1"
}

RESPONSE
"Updated successfully"
```

## Dish of order
```
REQUEST
POST http://127.0.0.1:8000/dishOfOrder/
{
    "tableNumber":"1",
    "dishId":"1"
}

RESPONSE
"Added successfully"
```

## Ingredients in dish 
```
REQUEST
POST http://127.0.0.1:8000/ingredientsInDish/
{
    "dishId":"1",
    "ingredientsId":"1",
    "quantityNeeded":"0.1"
}

RESPONSE
"Added successfully"
```
