#!/bin/bash

# --- Script that queries OpenRouter API and prints out the response ---
# It doesn't remember previous queries, obviously. 

# OPENROUTER_API_KEY="op://Personal/OpenRouter API/credential" # Fetch from 1P
OPENROUTER_API_KEY=$(op read "op://Personal/OpenRouter API/credential") # Fetch from 1P
echo $OPENROUTER_API_KEY

# NOTE: Here are some free models :
# meta-llama/llama-3-8b-instruct:free
# mistralai/mistral-7b-instruct:free
# As of July 2024, the Mistral model is way faster. 
# The Llama model may return null for some weird reason. In that case just run it again. 
MODEL="mistralai/mistral-7b-instruct:free"

# Read user input from command line arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <prompt>"
    exit 1
fi

# Prepare the API request payload
request_payload='{
  "model": "'$MODEL'",
  "messages": [
    {"role": "user", "content": "'$1'" }
  ]
}'

# Send the API request and store the response
response=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d "$request_payload" \
  https://openrouter.ai/api/v1/chat/completions)

# echo "$response"

# Extract the response message from the JSON
response_message=$(echo "$response" | jq -r '.choices[0].message.content')

# Printing out useful info

# Print out the model used in green color
echo -e "\033[34mModel: $MODEL\033[0m"

# Print the response message
echo "$response_message"
