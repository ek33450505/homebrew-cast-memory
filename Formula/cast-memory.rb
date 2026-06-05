class CastMemory < Formula
  desc "Persistent memory for Claude Code agents — FTS5 search, embeddings, MCP server"
  homepage "https://github.com/ek33450505/cast-memory"
  url "https://github.com/ek33450505/cast-memory/archive/refs/tags/v0.3.2.tar.gz"
  version "0.3.2"
  sha256 "02b5367c356748c05aeb1a178b3be776070f68b0f1be858378c76e1f38ade685"
  license "MIT"

  depends_on "python@3"

  def install
    libexec.install Dir["*"]

    # Symlink key scripts into bin
    %w[
      cast-memory-router.py
      cast-memory-embed.py
      cast-memory-validate.py
      cast-memory-consolidate.py
      cast-session-distiller.py
      cast-mcp-memory-server.py
    ].each do |script|
      bin.install_symlink libexec/"scripts/#{script}"
    end
  end

  def post_install
    system "bash", libexec/"install.sh"
  end

  def caveats
    <<~EOS
      cast-memory is installed. Scripts are available in your PATH:

        cast-memory-router.py --mode retrieve --agent shared --prompt "query"
        cast-memory-validate.py --check
        cast-memory-consolidate.py

      Optional — enable semantic search:
        ollama pull nomic-embed-text
        cast-memory-embed.py --backfill

      If you use the full CAST framework, memory persistence is already included.
      Docs: https://github.com/ek33450505/cast-memory
    EOS
  end

  test do
    assert_match "cast-memory-router", shell_output("ls #{bin}")
  end
end
