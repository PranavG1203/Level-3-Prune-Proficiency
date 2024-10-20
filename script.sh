#!/bin/bash

# Check if the answer.txt file exists
if [ ! -f answer.txt ]; then
    echo "Fail! answer.txt not found."
    exit 1
fi

content=$(tr -d '[:space:]' < answer.txt)

actual_sha256=$(echo -n "$content" | sha256sum | awk '{ print $1 }')

expected_sha256="d97a3833a90ab3318b9530407ceb9693ef31651cf5f7bcd4e88a407a6b05fd81"

if [ "$actual_sha256" != "$expected_sha256" ]; then
    echo "Fail! Hash does not match."
    exit 1
else
    echo "Pass!"
    exit 0
fi
