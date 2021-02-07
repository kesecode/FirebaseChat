#!/bin/sh

TOKEN=$(curl --location --request POST 'rest.kesecode.io/api/auth' --header 'Authorization: $REST_USER $REST_PASSWORD' | jq -r '.token')

echo $TOKEN
echo $COVERAGE

curl --location --request POST 'rest.kesecode.io/api/post' --header 'Authorization: Bearer '$TOKEN'' --header 'JSON: {"coverage": '$COVERAGE'}'
