#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Usage
if [ $# -ne 1 ]; then
  echo "Usage: $0 <timeline>"
  echo "Example: $0 anima"
  exit 1
fi

TIMELINE=$1
TIMELINE_UPPER=$(echo "$TIMELINE" | tr '[:lower:]' '[:upper:]')

echo -e "${GREEN}🚀 Setting up Kiro agent for timeline: ${TIMELINE}${NC}\n"

# Check we're in timeline repo
if [ ! -d "content" ]; then
  echo -e "${RED}❌ Error: content/ directory not found${NC}"
  echo "Run this script from the timeline repository root"
  exit 1
fi

# Remove legacy .amazonq folder if exists
if [ -d ".amazonq" ]; then
  echo "🗑️  Removing legacy .amazonq folder..."
  rm -rf .amazonq
  echo "   ✅ Removed"
fi

# Check .github exists
if [ ! -d "../.github" ]; then
  echo -e "${RED}❌ Error: ../.github/ not found${NC}"
  echo "Make sure .github repository is cloned alongside this timeline repo"
  exit 1
fi

# Create directories
echo "📁 Creating directories..."
mkdir -p .kiro/agents
mkdir -p .kiro/prompts

# Copy agent config
echo "📋 Copying agent configuration..."
cp ../.github/template/kiro-agent.json .kiro/agents/writer.json

# Copy prompt based on timeline
echo "✍️  Copying prompt template..."
if [ -f "../.github/template/.kiro/prompts/${TIMELINE}-writer-prompt.md" ]; then
  echo "   Using timeline-specific prompt: ${TIMELINE}-writer-prompt.md"
  cp "../.github/template/.kiro/prompts/${TIMELINE}-writer-prompt.md" .kiro/prompts/writer-prompt.md
else
  echo "   Using generic prompt template"
  cp ../.github/template/.kiro/prompts/writer-prompt.md .kiro/prompts/writer-prompt.md
fi

# Replace placeholders in agent.json
echo "🔧 Personalizing configuration..."
sed -i "s/\[TIMELINE\]/${TIMELINE_UPPER}/g" .kiro/agents/writer.json
sed -i "s/\[timeline\]/${TIMELINE}/g" .kiro/agents/writer.json

# Replace placeholders in prompt (if generic template)
if [ ! -f "../.github/template/.kiro/prompts/${TIMELINE}-writer-prompt.md" ]; then
  echo -e "${YELLOW}⚠️  Generic prompt template used - manual customization needed${NC}"
  echo "   Edit .kiro/prompts/writer-prompt.md and replace:"
  echo "   - [TIMELINE], [timeline]"
  echo "   - [TONE_DESCRIPTION], [LENGTH], [FOCUS_DESCRIPTION]"
fi

# Create docs structure
echo "📚 Creating planning docs structure..."
mkdir -p docs/{characters,episodes,locations}

# Copy timeline-steering template if not exists
if [ ! -f "docs/timeline-steering.md" ]; then
  echo "📝 Creating timeline-steering.md..."
  cp ../.github/template/timeline-steering-template.md docs/timeline-steering.md
  sed -i "s/\[TIMELINE_NAME\]/${TIMELINE_UPPER}/g" docs/timeline-steering.md
  sed -i "s/\[timeline\]/${TIMELINE}/g" docs/timeline-steering.md
fi

# Verify setup
echo -e "\n${GREEN}✅ Setup complete!${NC}\n"

echo "📋 Verification:"
echo "   Agent config: .kiro/agents/writer.json"
echo "   Prompt file: .kiro/prompts/writer-prompt.md"
echo "   Planning docs: docs/{characters,episodes,locations}/"
echo "   Timeline steering: docs/timeline-steering.md"

# Check for placeholders
echo -e "\n🔍 Checking for remaining placeholders..."
if grep -q '\[TIMELINE\]\|\[timeline\]' .kiro/agents/writer.json 2>/dev/null; then
  echo -e "${RED}   ❌ Placeholders found in agent.json${NC}"
else
  echo -e "${GREEN}   ✅ agent.json looks good${NC}"
fi

if grep -q '\[TIMELINE\]\|\[timeline\]' .kiro/prompts/writer-prompt.md 2>/dev/null; then
  echo -e "${YELLOW}   ⚠️  Placeholders found in prompt (manual customization needed)${NC}"
else
  echo -e "${GREEN}   ✅ prompt looks good${NC}"
fi

# Next steps
echo -e "\n${GREEN}📝 Next steps:${NC}"
echo "1. Edit docs/timeline-steering.md with timeline-specific info"
echo "2. Create character sheets in docs/characters/"
echo "3. Create episode outlines in docs/episodes/"
echo "4. Sync database:"
echo "   npx -y @echoes-io/mcp-server timeline-sync --timeline ${TIMELINE} --contentPath ./content"
echo "   npx -y @echoes-io/mcp-server rag-index --timeline ${TIMELINE} --contentPath ./content"
echo "5. Test agent:"
echo "   kiro chat"
echo ""
