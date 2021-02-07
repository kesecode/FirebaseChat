#!/bin/sh

COVERAGE=`jq -r '.lineCoverage' result.json`

TOKEN=$(curl --location --request POST 'rest.kesecode.io/api/auth' --header 'Authorization: test@user.de abcabc' | jq -r '.token')

curl --location --request POST 'rest.kesecode.io/api/post' --header 'Authorization: Bearer '$TOKEN'' --header 'JSON: {"coverage": '$COVERAGE'}'
