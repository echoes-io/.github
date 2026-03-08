# Echoes.io

**Multi-POV storytelling platform** where characters' voices echo through interconnected narratives across different timelines.

## 🎭 What is Echoes?

Echoes is a platform for telling rich, layered stories from multiple perspectives. Each timeline represents a different narrative universe, with characters whose experiences resonate and connect across the stories.

### Timelines

- **🌿 Anima** - Stories of growth, support, and tenderness
- **❤️ Eros** - Tales of passion, intensity, and raw emotion
- **🌸 Bloom** - Narratives of discovery, balance, and blossoming
- **💫 Pulse** - Personal diary entries, reflections, and authentic moments

## 🏗️ Architecture

### Content Repositories

- **[timeline-anima](https://github.com/echoes-io/timeline-anima)** - 55 chapters across arcs: matilde (5), anima (50)
- **[timeline-eros](https://github.com/echoes-io/timeline-eros)** - 266 chapters across arcs: ale (122), gio (57), work (87)
- **[timeline-bloom](https://github.com/echoes-io/timeline-bloom)** - 5 chapters in arc: bloom (5)
- **[timeline-pulse](https://github.com/echoes-io/timeline-pulse)** - Personal diary format, Nic's POV

### Tools & Services

- **[@echoes-io/mcp-server](https://github.com/echoes-io/mcp-server)** - AI integration via MCP: content management, RAG/semantic search, knowledge graph
- **[@echoes-io/books-generator](https://github.com/echoes-io/books-generator)** - Book compilation: markdown → PDF
- **[@echoes-io/brand](https://github.com/echoes-io/brand)** - Visual identity: timeline palettes, typography, design tokens

### Planned

- **web-app** - Frontend application (dormant)

## 🛠️ Tech Stack

- **Language**: TypeScript (strict mode)
- **Database**: SQLite + LanceDB (mcp-server)
- **AI**: Model Context Protocol + HuggingFace embeddings
- **Validation**: Zod schemas
- **Testing**: Vitest
- **CI/CD**: GitHub Actions + semantic-release

## 📚 Content Structure

```
Timeline → Arc → Episode → Chapter (.md with YAML frontmatter)
```

326+ chapters organized with consistent naming: `ep01-ch001-pov-title.md`

Each chapter includes structured metadata for POV, timeline, location, and content statistics.

---

*Echoes: where stories resonate across timelines* ✨
