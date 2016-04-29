#!/bin/bash
# Will not be allowing users to add cheeses - testing only

curl --include --request PATCH http://localhost:3000/cheeses/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "board": {
      "family": "cheese",
      "name": "name",
      "milk_type": "milk"
      "country_of_origin": "country_of_origin"
      "flavor": "flavor"
    }
  }'
