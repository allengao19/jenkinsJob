#!/bin/bash
response=$(curl -s -o /dev/null -w "%{http_code}" https://dashboard.heroku.com/apps/jenkins-job)
if [ $response -eq 200 ]; then
    echo "Endpoint responded with HTTP 200, test passed!"
else
    echo "Endpoint test failed. Expected HTTP 200, but got: $response"
    exit 1
fi
