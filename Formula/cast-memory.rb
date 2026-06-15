class CastMemory < Formula
  desc "Persistent memory for Claude Code agents — FTS5 search, embeddings, MCP server"
  homepage "https://github.com/ek33450505/cast-memory"
  url "https://github.com/ek33450505/cast-memory/archive/refs/tags/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "638ea977704f93fab4df069c6c92ad1affa512185ccd8abb28577e1a9260fe30"
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
