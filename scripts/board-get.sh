#!/bin/bash

curl --include --request GET http://localhost:3000/boards/$ID \
  --header "Authorization: Token token=$TOKEN"
