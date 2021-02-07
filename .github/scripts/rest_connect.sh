#!/bin/sh

USER=$1
PASSWORD=$2

TOKEN=$(curl --location --request POST 'rest.kesecode.io/api/auth' --header 'Authorization: '$USER' '$PASSWORD'' | jq -r '.token')

echo $COVERAGE

curl --location --request POST 'rest.kesecode.io/api/post' --header 'Authorization: Bearer '$TOKEN'' --header 'JSON: {"coverage": '$COVERAGE'}'
