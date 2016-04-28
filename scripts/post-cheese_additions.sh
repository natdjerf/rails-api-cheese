#!/bin/bash

curl --include --request POST http://localhost:3000/cheese_additions \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "cheese_addition": {
      "board_id": "2",
      "cheese_id": "4"
    }
  }'
