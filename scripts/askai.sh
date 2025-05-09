#!/bin/bash

# --- Script that queries OpenRouter API and prints out the response ---

# NOTE: It doesn't remember previous queries (obviously)!

# Define models as an associative array for easier management
declare -A MODELS=(
    ["claude"]="anthropic/claude-3.7-sonnet:beta"
    ["mistral"]="mistralai/mistral-7b-instruct:free"
    ["gemini"]="google/gemini-2.0-flash-exp:free"
    ["deepseek"]="deepseek/deepseek-r1:free"
    ["gpt4omini"]="openai/gpt-4o-mini"
    ["gpto4minihigh"]="openai/o4-mini-high"
)

# Default model
MODEL_KEY="claude"
MODEL="${MODELS[$MODEL_KEY]}"

# Function to show usage
show_usage() {
    echo "Usage: askai.sh [-m model] <prompt>"
    echo "Example: askai.sh -m claude \"What is the meaning of life?\""
    echo "Models:"

    # Dynamically list all available models with the default marked
    for key in "${!MODELS[@]}"; do
        if [[ "$key" == "$MODEL_KEY" ]]; then
            echo "  -m $key : Use ${MODELS[$key]} (default)"
        else
            echo "  -m $key : Use ${MODELS[$key]}"
        fi
    done
    exit 1
}

# Parse command line options
while getopts "m:h" opt; do
    case $opt in
        m)
            if [[ -n "${MODELS[${OPTARG}]}" ]]; then
                MODEL_KEY="${OPTARG}"
                MODEL="${MODELS[$MODEL_KEY]}"
            else
                echo "Invalid model: ${OPTARG}"
                show_usage
            fi
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

# Print out the model used in gray color
echo -e "\e[0;30mModel: $MODEL\e[0m"

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

    # Print the content if it's not empty, properly handling escape sequences
    if [ ! -z "$content" ]; then
        # Process the content to properly handle escape sequences like \n
        content=$(echo -e "$content")
        printf "%s" "$content"
    fi
done

# Print a final newline
echo
