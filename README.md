# homebrew-cast-memory

Homebrew tap for [cast-memory](https://github.com/ek33450505/cast-memory) — persistent memory for Claude Code agents.

## Install

```bash
brew tap ek33450505/cast-memory
brew install cast-memory
```

## What You Get

- `cast-memory-router.py` — FTS5 search and relevance-scored memory retrieval
- `cast-memory-embed.py` — Semantic embeddings via Ollama nomic-embed-text
- `cast-memory-validate.py` — Staleness validation and reference checking
- `cast-memory-consolidate.py` — Weekly dedup, decay, and archival
- `cast-session-distiller.py` — End-of-session pattern extraction
- `cast-mcp-memory-server.py` — MCP server for external tool access

## Uninstall

```bash
brew uninstall cast-memory
brew untap ek33450505/cast-memory
```
