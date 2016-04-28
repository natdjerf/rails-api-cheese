#!/bin/bash

curl --include --request DELETE http://localhost:3000/cheese_additions/$ID \
  --header "Authorization: Token token=$TOKEN"
