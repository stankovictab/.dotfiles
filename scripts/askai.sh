#!/bin/bash

# --- Script that queries OpenRouter API and prints out the response ---

# NOTE: It doesn't remember previous queries (obviously)!

# System prompt that will be sent with every request
BASE_SYSTEM_PROMPT="You are responding to queries from a command-line interface. The user is accessing you through a Bash script in their terminal. Keep your responses concise and well-formatted for terminal viewing. Use two new lines instead of one for easier readability. Don't use Markdown formatting. Remember the user can't interact with you beyond this single query, so provide complete information in one response."

# ANSI color prompt addition
ANSI_PROMPT_ADDITION="Format your response with ANSI color codes for better readability. Use colors thoughtfully to highlight important information, headers, code, and key points. Use colors like \e[36m (cyan), \e[33m (yellow), \e[32m (green), \e[35m (magenta), and \e[1m (bold) to structure your response, but don't overuse them. Be sure to reset colors with \e[0m when appropriate."

# Default system prompt
SYSTEM_PROMPT="$BASE_SYSTEM_PROMPT"

# Define models as an associative array for easier management
declare -A MODELS=(
    ["claude"]="anthropic/claude-3.7-sonnet"
    ["mistral"]="mistralai/mistral-7b-instruct:free"
    ["gemini"]="google/gemini-2.0-flash-exp:free"
    ["deepseek"]="deepseek/deepseek-r1:free"
    ["gpt4omini"]="openai/gpt-4o-mini"
    ["gpto4minihigh"]="openai/o4-mini-high"
)

# Default model
MODEL_KEY="claude"
MODEL="${MODELS[$MODEL_KEY]}"
USE_ANSI=false

# Function to show usage
show_usage() {
    echo "Usage: askai.sh [-m model] [--ansi] <prompt>"
    echo "Example: askai.sh -m claude --ansi \"What is the meaning of life?\""
    echo "Options:"
    echo "  --ansi : Enable ANSI colored output"
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
while [[ $# -gt 0 ]]; do
    case $1 in
        -m)
            if [[ -n "${MODELS[$2]}" ]]; then
                MODEL_KEY="$2"
                MODEL="${MODELS[$MODEL_KEY]}"
                shift 2
            else
                echo "Invalid model: $2"
                show_usage
            fi
            ;;
        --ansi)
            USE_ANSI=true
            shift
            ;;
        -h|--help)
            show_usage
            ;;
        -*)
            echo "Unknown option: $1"
            show_usage
            ;;
        *)
            # Break once we hit the prompt
            break
            ;;
    esac
done

# Check if prompt is provided
if [ $# -lt 1 ]; then
    show_usage
fi

# Combine all remaining arguments into one prompt string
PROMPT="$*"

# Update system prompt if ANSI is enabled
if [ "$USE_ANSI" = true ]; then
    SYSTEM_PROMPT="$BASE_SYSTEM_PROMPT $ANSI_PROMPT_ADDITION"
fi

# Fetch API key from 1Password
OPENROUTER_API_KEY=$(op read "op://Personal/OpenRouter API/credential")
# DEBUG: echo $OPENROUTER_API_KEY

# Properly escape the system prompt and user prompt for JSON
SYSTEM_PROMPT_ESCAPED=$(echo "$SYSTEM_PROMPT" | sed 's/"/\\"/g')
PROMPT_ESCAPED=$(echo "$PROMPT" | sed 's/"/\\"/g')

# Prepare the API request payload with system message
request_payload='{
  "model": "'$MODEL'",
  "messages": [
    {"role": "system", "content": "'"$SYSTEM_PROMPT_ESCAPED"'" },
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
