#!/bin/bash

# --- Script that queries OpenRouter API and prints out the response ---
# It doesn't remember previous queries, obviously.

# Available models
CLAUDE="anthropic/claude-3.7-sonnet:beta"
MISTRAL="mistralai/mistral-7b-instruct:free"
GEMINI="google/gemini-2.0-flash-exp:free"
DEEPSEEK="deepseek/deepseek-r1:free"
GPT4OMINI="openai/gpt-4o-mini"
GPTO4MINIHIGH="openai/o4-mini-high"

# Default model
MODEL=$CLAUDE

# Function to show usage
show_usage() {
    echo "Usage: askai.sh [-m model] <prompt>"
    echo "Example: askai.sh -m claude \"What is the meaning of life?\""
    echo "Models:"
    echo "  -m claude   : Use Claude 3.7 Sonnet (default)"
    echo "  -m mistral  : Use Mistral 7B"
    echo "  -m gemini   : Use Gemini 2.0"
    echo "  -m deepseek : Use Deepseek R1 Free"
    echo "  -m gpt4omini: Use GPT-4O Mini"
    echo "  -m gpto4minihigh: Use GPT o4 Mini High"
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
                gpt4omini)
                    MODEL=$GPT4OMINI
                    ;;
                gpto4minihigh)
                    MODEL=$GPTO4MINIHIGH
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

# Combine all remaining arguments into one prompt string
PROMPT="$*"

# Fetch API key from 1Password
OPENROUTER_API_KEY=$(op read "op://Personal/OpenRouter API/credential")
# DEBUG: echo $OPENROUTER_API_KEY

# Properly escape the prompt for JSON
PROMPT_ESCAPED=$(echo "$PROMPT" | sed 's/"/\\"/g')

# Prepare the API request payload
request_payload='{
  "model": "'$MODEL'",
  "messages": [
    {"role": "user", "content": "'"$PROMPT_ESCAPED"'" }
  ],
  "stream": true
}'

# Print out the model used in blue color
echo -e "\033[34mModel: $MODEL\033[0m"

# Send the API request and process the streaming response
curl -N -s -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d "$request_payload" \
  https://openrouter.ai/api/v1/chat/completions | while read -r line; do
    # Skip empty lines
    [ -z "$line" ] && continue

    # Remove "data: " prefix if present
    line="${line#data: }"

    # Skip [DONE] message
    [[ "$line" == "[DONE]" ]] && continue

    # Parse the JSON and extract the content
    content=$(echo "$line" | jq -r '.choices[0].delta.content // empty' 2>/dev/null)

    # Print the content without newline if it's not empty
    [ ! -z "$content" ] && printf "%s" "$content"
done

# Print a final newline
echo
