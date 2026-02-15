#!/bin/bash

# Read JSON input from stdin
INPUT=$(cat)

# Extract file path from the JSON input
FILE_PATH=$(echo "$INPUT" | python3 -c "import sys, json; data=json.load(sys.stdin); print(data.get('tool_input', {}).get('file_path', ''))" 2>/dev/null)

# Check if this is the chapter file we're monitoring
if [[ "$FILE_PATH" == */chap21-yukamiya.re ]]; then
    # Count characters in the file
    CHARS=$(wc -m < "$FILE_PATH" 2>/dev/null || echo 0)
    TARGET=5000
    REMAINING=$((TARGET - CHARS))
    PERCENT=$((CHARS * 100 / TARGET))

    # Create status message
    if [ $CHARS -lt $TARGET ]; then
        STATUS="残り: ${REMAINING} 文字"
    else
        OVER=$((CHARS - TARGET))
        STATUS="⚠️  目標超過: ${OVER} 文字"
    fi

    # Output JSON with systemMessage for user notification
    cat <<EOF
{
  "systemMessage": "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n📝 chap21-yukamiya.re 文字数レポート\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n現在: ${CHARS} 文字\n目標: ${TARGET} 文字\n進捗: ${PERCENT}%\n${STATUS}\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
  "continue": true
}
EOF
else
    # For other files, return empty JSON
    echo '{}'
fi
