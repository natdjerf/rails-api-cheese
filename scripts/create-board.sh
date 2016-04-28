#!/bin/bash

curl --include --request POST http://localhost:3000/boards \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "board": {
      "name": "name",
      "user_id": "id"
    }
  }'

  curl "http://localhost:3000/boards/$ID" \
    --include \
    --request POST \
    --header "Authorization: Token token=$TOKEN" \
    --header "Content-Type: application/json" \
    --data "{
        \"board\" : {
            \"name\" : \"$NAME\",
            \"user_id\" : \"$USER_ID\"
          }
    }"
