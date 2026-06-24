#!/bin/bash

OUTPUT=$(./build/c_pipeline)

if [[ "$OUTPUT" == "Hello from Jenkins CI/CD Pipeline!" ]]
then
    echo "Test Passed"
    exit 0
else
    echo "Test Failed"
    exit 1
fi
