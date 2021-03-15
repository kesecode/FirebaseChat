#!/bin/sh

COVERAGE=`jq -r '.lineCoverage' result.json`
COVERAGE=$(echo "scale=2; $COVERAGE * 100" | bc)
COVERAGE=$(echo ${COVERAGE%.*})

TOKEN=$(curl --location --request POST 'rest.kesecode.io/api/auth' --header 'Authorization: '$USER' '$PASSWORD'' | jq -r '.token')

curl --location --request POST 'rest.kesecode.io/api/post' --header 'Authorization: Bearer '$TOKEN'' --header 'JSON: {"coverage": '$COVERAGE'}'
