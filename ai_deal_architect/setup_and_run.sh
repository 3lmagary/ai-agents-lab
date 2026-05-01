#!/bin/bash

# Stop on errors
set -e

echo "======================================================="
echo "🚀 Welcome to the AI Deal Architect Setup Wizard"
echo "======================================================="
echo ""
echo "We need some basic configuration for the system to work properly."
echo "These settings will be saved and you won't be asked again unless you delete the .env file."
echo ""

# Check if .env exists
if [ -f ".env" ]; then
    echo "✅ .env file already exists."
    read -p "Do you want to re-enter your API keys? (y/n): " reset_keys
    if [ "$reset_keys" == "y" ]; then
        rm -f .env
    fi
fi

# Prompt for API keys if .env does not exist
if [ ! -f ".env" ]; then
    read -p "🔑 Enter your OpenRouter API Key: " openrouter_key
    read -p "🔑 Enter your Firecrawl API Key: " firecrawl_key

    # Create .env
    echo ""
    echo "🛠️ Creating and configuring .env file..."
    cat <<EOF > .env
# OpenRouter Settings
OPENAI_API_BASE="https://openrouter.ai/api/v1"
OPENAI_API_KEY="$openrouter_key"
OPENAI_MODEL_NAME="openrouter/openai/gpt-4o-mini"

# Firecrawl Settings
FIRECRAWL_API_KEY="$firecrawl_key"
EOF
    echo "✅ Configuration file created successfully."
fi

# Virtual Environment Setup
echo ""
echo "🐍 Checking Virtual Environment (venv)..."

# Fix broken venv if it was copied from another directory
if [ -d "venv" ]; then
    if ! ./venv/bin/python --version > /dev/null 2>&1; then
        echo "⚠️ Broken virtual environment detected. Recreating..."
        rm -rf venv
    fi
fi

if [ ! -d "venv" ]; then
    echo "Creating a new Python virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment created."
else
    echo "✅ Virtual environment is ready."
fi

# Install/Update Dependencies
echo ""
echo "📦 Checking and installing required packages..."
# Using the venv pip directly
./venv/bin/pip install --upgrade pip > /dev/null
./venv/bin/pip install -r requirements.txt > /dev/null
echo "✅ Packages are installed and up to date."

echo ""
echo "======================================================="
echo "🎉 Setup is complete."
echo "▶️ Starting AI Deal Architect..."
echo "======================================================="
echo ""

# Export current path to prevent import errors
export PYTHONPATH=$(pwd)

# Run the project from the src directory
source venv/bin/activate
python src/main.py
