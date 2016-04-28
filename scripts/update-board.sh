#!/bin/bash
  curl "http://localhost:3000/boards/$ID" \
    --include \
    --request PATCH \
    --header "Authorization: Token token=$TOKEN" \
    --data "{
        \"board\" : {
            \"name\" : \"$NAME\"
          }
    }"
