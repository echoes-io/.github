.PHONY: install install-echoes install-zweer launch-writer launch-web-dev server help

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: install-zweer install-echoes ## Install CAO + all agents (Zweer + Echoes)

install-zweer: ## Install CAO prerequisites and Zweer generic agents
	@echo "🔧 Installing CAO + Zweer agents via @zweer/dev..."
	@npx @zweer/dev@latest cao install
	@echo "✅ CAO and Zweer agents installed!"

install-echoes: ## Install Echoes agents
	@echo "🤖 Installing Echoes CAO Agents..."
	@for agent in cao-agents/writer/*.md cao-agents/dev/*.md; do \
		if [ -f "$$agent" ]; then \
			echo "  Installing $$(basename $$agent)..."; \
			cao install "$$agent"; \
		fi; \
	done
	@echo "✅ Echoes agents installed!"

launch-writer: ## Launch echoes_writer agent for content creation
	@cao launch --agents echoes_writer

launch-web-dev: ## Launch echoes_web_dev agent for web development
	@cao launch --agents echoes_web_dev

server: ## Launch the CAO server
	@cao-server
