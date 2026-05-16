# Echoes.io

**Multi-POV storytelling platform** where characters' voices echo through interconnected narratives across different timelines.

## 🎭 What is Echoes?

Echoes is a platform for telling rich, layered stories from multiple perspectives. Each timeline represents a different narrative universe, with characters whose experiences resonate and connect across the stories.

### Timelines

- **❤️ Eros** — Passion, intensity, raw emotion. Explicit, dual POV, serial.
- **🌿 Anima** — Growth, tenderness, transformation. Literary, single POV, novels.
- **✨ Glow** — Lightness, pleasure, adult joy. Explicit, single POV, serial.
- **🌸 Bloom** — Discovery, balance, blossoming.
- **💫 Pulse** — Intimate voices, fragments, confessions. Standalone pieces.

## 🏗️ Architecture

### Content Repositories

- **[timeline-eros](https://github.com/echoes-io/timeline-eros)** — Arcs: ale, ele, cri, manu, ro, work
- **[timeline-anima](https://github.com/echoes-io/timeline-anima)** — Arcs: london, milan
- **[timeline-glow](https://github.com/echoes-io/timeline-glow)** — Arcs: vale, gio
- **[timeline-bloom](https://github.com/echoes-io/timeline-bloom)** — Arc: bloom
- **[timeline-pulse](https://github.com/echoes-io/timeline-pulse)** — LEI voices (cri, ale, ele) + Nic backstory

### Tools & Services

- **[@echoes-io/mcp-server](https://github.com/echoes-io/mcp-server)** — AI integration via MCP: content management, RAG/semantic search, knowledge graph
- **[@echoes-io/books-generator](https://github.com/echoes-io/books-generator)** — Book compilation: markdown → PDF
- **[@echoes-io/brand](https://github.com/echoes-io/brand)** — Visual identity: timeline palettes, typography, design tokens
- **[@echoes-io/resonance](https://github.com/echoes-io/resonance)** — Commercial intelligence: pattern analysis, arc structures, agent design

## 🛠️ Tech Stack

- **Language**: TypeScript (strict mode)
- **Database**: SQLite + LanceDB (mcp-server)
- **AI**: Model Context Protocol + HuggingFace embeddings
- **Validation**: Zod schemas
- **Testing**: Vitest
- **CI/CD**: GitHub Actions

## 📚 Content Structure

```
Timeline → Arc → [Episode/Volume] → Chapter (.md with YAML frontmatter)
```

Chapter filename: `ch{YYY}-{pov}-{title-slug}.md`

---

*Echoes: where stories resonate across timelines* ✨
