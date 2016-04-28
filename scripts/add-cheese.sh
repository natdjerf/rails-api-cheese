#!/bin/bash
# Will not be allowing users to add cheeses - testing only

curl --include --request POST http://localhost:3000/cheeses \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
      "cheese": {
          "name": "asiago",
          "milk_type": "cow",
          "country_of_origin": "Italy",
          "board_id": 18,
          "family": "hard"
        }
      }'


curl --include --request POST http://localhost:3000/boards \
  --header "Authorization: Token token=BAhJIiU1Yzc1ZGI0OTQ1M2NlMTVlYWVjNjBjOWZiNjZmYmU3ZgY6BkVG--e0bb81127141f44d3bfbed578458560d6b3e9cc2" \
  --header "Content-Type: application/json" \
  --data '{
    "board": {
      "name": "wolverines board",
      "user_id" : "1"
    }
  }'
