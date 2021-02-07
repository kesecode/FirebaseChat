#!/bin/sh

TOKEN=$(curl --location --request POST 'rest.kesecode.io/api/auth' --header 'Authorization: test@user.de abcabc' | jq -r '.token')

echo $TOKEN
echo $COVERAGE

curl --location --request POST 'rest.kesecode.io/api/post' --header 'Authorization: Bearer '$TOKEN'' --header 'JSON: {"coverage": '$COVERAGE'}'
