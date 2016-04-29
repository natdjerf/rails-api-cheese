#!/bin/bash

curl --include --request DELETE http://localhost:3000/boards/$ID \
  --header "Authorization: Token token=$TOKEN"
