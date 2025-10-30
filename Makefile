.PHONY: install launch-writer launch-web-dev server help

BASE_URL = https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install CAO prerequisites and all agents
	@echo "🔧 Installing CAO prerequisites..."
	@echo "  Installing tmux configuration..."
	@curl -s https://raw.githubusercontent.com/awslabs/cli-agent-orchestrator/refs/heads/main/tmux-install.sh | bash
	@echo "  Installing uv..."
	@curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "  Installing CAO..."
	@uv tool install git+https://github.com/awslabs/cli-agent-orchestrator.git@main --upgrade
	@echo ""
	@echo "🤖 Installing Echoes.io CAO Agents..."
	@for category in cao-agents/*/; do \
		category_name=$$(basename $$category); \
		echo "📁 Installing $$category_name agents..."; \
		for agent in $$category*.md; do \
			if [ -f "$$agent" ] && [ "$$(basename $$agent)" != "README.md" ]; then \
				agent_path=$$(echo $$agent | sed 's|cao-agents/||'); \
				echo "  Installing $$(basename $$agent)..."; \
				cao install "$(BASE_URL)/$$agent_path"; \
			fi; \
		done; \
	done
	@echo "✅ All CAO agents installed!"

launch-writer: ## Launch writer agent for content creation
	@cao launch --agents writer

launch-web-dev: ## Launch web_dev agent for web development
	@cao launch --agents web_dev

server: ## Launch the CAO server
	@cao-server
