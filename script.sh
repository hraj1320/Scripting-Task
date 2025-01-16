#!/bin/bash

# Task 1: Fetch HTTP Status Code
url="https://www.guvi.in"
http_status=$(curl -o /dev/null -s -w "%{http_code}\n" "$url")

# Print success/failure message based on HTTP status code
if [[ "$http_status" -eq 200 ]]; then
    echo "✅ Success: $url is accessible. HTTP Status Code: $http_status"
else
    echo "❌ Failure: Unable to access $url. HTTP Status Code: $http_status"
fi

# Task 2: Replace "give" with "learning" from 5th line onwards in lines containing "welcome"
input_file="input.txt"
temp_file="temp.txt"

# Using awk to process the file
awk 'NR < 5 {print; next} /welcome/ {gsub(/give/, "learning")} {print}' "$input_file" > "$temp_file"

# Overwrite original file with modified content
mv "$temp_file" "$input_file"

echo "✅ Text replacement task completed successfully!"
