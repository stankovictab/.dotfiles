#!/bin/bash

# --- Script that queries OpenRouter API and prints out the response ---
# It doesn't remember previous queries, obviously.

# Available models
CLAUDE="anthropic/claude-3.5-sonnet:beta"
MISTRAL="mistralai/mistral-7b-instruct:free"
GEMINI="google/gemini-2.0-flash-exp:free"
DEEPSEEK="deepseek/deepseek-r1:free"

# Default model
MODEL=$CLAUDE

# Function to show usage
show_usage() {
    echo "Usage: $0 [-m model] <prompt>"
    echo "Models:"
    echo "  -m claude   : Use Claude 3.5 Sonnet (default)"
    echo "  -m mistral  : Use Mistral 7B"
    echo "  -m gemini   : Use Gemini 2.0"
    echo "  -m deepseek : Use Deepseek R1 Free"
    exit 1
}

# Parse command line options
while getopts "m:h" opt; do
    case $opt in
        m)
            case "${OPTARG}" in
                claude)
                    MODEL=$CLAUDE
                    ;;
                mistral)
                    MODEL=$MISTRAL
                    ;;
                gemini)
                    MODEL=$GEMINI
                    ;;
                deepseek)
                    MODEL=$DEEPSEEK
                    ;;
                *)
                    echo "Invalid model: ${OPTARG}"
                    show_usage
                    ;;
            esac
            ;;
        h)
            show_usage
            ;;
        \?)
            show_usage
            ;;
    esac
done

# Shift the options so $@ contains only the prompt
shift $((OPTIND-1))

# Check if prompt is provided
if [ $# -lt 1 ]; then
    show_usage
fi

# Fetch API key from 1Password
OPENROUTER_API_KEY=$(op read "op://Personal/OpenRouter API/credential")
# DEBUG: echo $OPENROUTER_API_KEY

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

# Extract the response message from the JSON
response_message=$(echo "$response" | jq -r '.choices[0].message.content')

# Print out the model used in blue color
echo -e "\033[34mModel: $MODEL\033[0m"

# Print the response message
echo "$response_message"
