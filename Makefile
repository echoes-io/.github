.PHONY: install-cao-agents help

BASE_URL = https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install-cao-agents: ## Install all CAO agents for echoes.io
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
	@echo "🚀 Usage:"
	@echo "  cao launch --agents writing    # For content creation"
	@echo "  cao launch --agents web_dev    # For web development"
