#!/bin/sh

COVERAGE=`jq -r '.lineCoverage' result.json`

TOKEN=$(curl --location --request POST 'rest.kesecode.io/api/auth' --header 'Authorization: '$USER' '$PASSWORD'' | jq -r '.token')

curl --location --request POST 'rest.kesecode.io/api/post' --header 'Authorization: Bearer '$TOKEN'' --header 'JSON: {"coverage": '$COVERAGE'}'
