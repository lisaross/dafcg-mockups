#!/bin/bash
# Pre-edit validation hook: check structure and requirements before editing
set -euo pipefail

LOG_FILE=".claude/activity.log"

# Ensure log file exists
mkdir -p .claude
touch "$LOG_FILE"

echo "🔍 Pre-edit validation for ${CLAUDE_TOOL_NAME:-unknown} at $(date)" >> "$LOG_FILE"

# Human-in-the-loop reminders for sensitive files
if [[ "${CLAUDE_TOOL_ARGS:-}" == *"CLAUDE.md"* ]]; then
    echo "  🚨 HUMAN REVIEW REQUIRED: Editing CLAUDE.md" >> "$LOG_FILE"
    echo "  📋 Remember to validate all changes align with project goals" >> "$LOG_FILE"
fi

if [[ "${CLAUDE_TOOL_ARGS:-}" == *"settings"* ]]; then
    echo "  🚨 HUMAN REVIEW REQUIRED: Editing settings file" >> "$LOG_FILE"
    echo "  ⚙️  Validate configuration changes before proceeding" >> "$LOG_FILE"
fi

if [[ "${CLAUDE_TOOL_ARGS:-}" == *"requirements"* ]] || [[ "${CLAUDE_TOOL_ARGS:-}" == *"project-overview"* ]]; then
    echo "  🚨 HUMAN REVIEW REQUIRED: Editing core project documentation" >> "$LOG_FILE"
    echo "  📖 Ensure changes maintain 5-pillar structure and business goals" >> "$LOG_FILE"
fi

# Check for potential security issues
if [[ "${CLAUDE_TOOL_ARGS:-}" == *"API"* ]] || [[ "${CLAUDE_TOOL_ARGS:-}" == *"KEY"* ]] || [[ "${CLAUDE_TOOL_ARGS:-}" == *"SECRET"* ]]; then
    echo "  ⚠️  WARNING: Potential security-sensitive content detected" >> "$LOG_FILE"
    echo "  🔒 Ensure no API keys or secrets are being committed" >> "$LOG_FILE"
fi

# Validate 5-pillar structure alignment
if [[ "${CLAUDE_TOOL_NAME:-}" =~ ^(Edit|Write|MultiEdit)$ ]]; then
    echo "  📊 Checking 5-pillar alignment..." >> "$LOG_FILE"
    
    # If editing docs, remind about pillar structure
    if [[ "${CLAUDE_TOOL_ARGS:-}" == *"docs/"* ]]; then
        echo "    💡 Remember: All changes should align with the 5-pillar approach" >> "$LOG_FILE"
        echo "    📋 Pillars: 1-Acquisition, 2-Gathering, 3-Processing, 4-Analysis, 5-Reporting" >> "$LOG_FILE"
    fi
    
    # If editing code, remind about human-in-the-loop
    if [[ "${CLAUDE_TOOL_ARGS:-}" == *".py"* ]] || [[ "${CLAUDE_TOOL_ARGS:-}" == *".sh"* ]]; then
        echo "    🤖 Remember: All AI suggestions require human validation" >> "$LOG_FILE"
        echo "    👥 This is a human-in-the-loop project - maintain oversight" >> "$LOG_FILE"
    fi
fi

# Markdown standards reminder for markdown files
if [[ "${CLAUDE_TOOL_ARGS:-}" == *".md"* ]] && [[ "${CLAUDE_TOOL_NAME:-}" =~ ^(Edit|Write|MultiEdit)$ ]]; then
    echo "  📝 MARKDOWN REMINDER: Follow prevention standards" >> "$LOG_FILE"
    echo "    • 120 char max lines (break at commas, 'and/or')" >> "$LOG_FILE"
    echo "    • Specify code block languages (python, bash, text)" >> "$LOG_FILE"
    echo "    • Unique headings within document" >> "$LOG_FILE"
    echo "    • Sequential ordered list numbering (1, 2, 3)" >> "$LOG_FILE"
    echo "    • Reference: .claude/markdown-standards.md" >> "$LOG_FILE"
fi

# Check if CLAUDE.md TODOs are current
if [[ -f "CLAUDE.md" ]] && [[ "${CLAUDE_TOOL_NAME:-}" =~ ^(Edit|Write|MultiEdit)$ ]]; then
    if grep -q "TODO for Next Session" "CLAUDE.md" 2>/dev/null; then
        echo "  ✅ CLAUDE.md has active TODOs" >> "$LOG_FILE"
    else
        echo "  📝 Consider updating CLAUDE.md TODOs after this operation" >> "$LOG_FILE"
    fi
fi

# Cost consciousness reminder for GCP-related operations
if [[ "${CLAUDE_TOOL_ARGS:-}" == *"bigquery"* ]] || [[ "${CLAUDE_TOOL_ARGS:-}" == *"gcp"* ]] || [[ "${CLAUDE_TOOL_ARGS:-}" == *"cloud"* ]]; then
    echo "  💰 COST REMINDER: Monitor GCP free tier usage" >> "$LOG_FILE"
    echo "  📊 BigQuery: 10GB storage + 1TB queries/month free" >> "$LOG_FILE"
fi

echo "  ✅ Pre-edit validation complete" >> "$LOG_FILE"