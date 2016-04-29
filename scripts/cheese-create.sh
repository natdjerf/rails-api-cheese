#!/bin/bash
# Will not be allowing users to add cheeses - testing only

curl --include --request POST http://localhost:3000/cheeses \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
      "cheese": {
          "family": "hard"
          "name": "asiago",
          "milk_type": "cow",
          "country_of_origin": "Italy",
          "flavor": "flavor",
        }
      }'
