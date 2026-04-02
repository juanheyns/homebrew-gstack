class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.17"
  license "MIT"

  depends_on "juanheyns/gstack/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-agent-darwin-arm64.tar.gz"
      sha256 "577e22d6597efb48d452ed04c5c3aed9c307f1e5f3679c9b41ddcf349796c7b9"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-agent-darwin-x86_64.tar.gz"
      sha256 "cd4cff320998f210d78013055319e6d34cb177e7c92f85d69236c5ba40066434"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-agent-linux-arm64.tar.gz"
      sha256 "9fd60f8ca66e165f96d4567c74509645d3a0fdd97f046211abad98f36ed042b0"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-agent-linux-x86_64.tar.gz"
      sha256 "978a1f3871def52e8fb7cfc8df3c69e4a3571e792827b67443e0f951f2c645ce"
    end
  end

  def install
    bin.install "browse-agent"
    bin.install "sidebar-agent.mjs"
  end

  def caveats
    <<~EOS
      Requires the claude CLI (Claude Code) in PATH.
      Install from: https://claude.ai/download
    EOS
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
