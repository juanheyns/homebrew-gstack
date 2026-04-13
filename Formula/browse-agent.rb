class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.20"
  license "MIT"

  depends_on "juanheyns/gstack/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-agent-darwin-arm64.tar.gz"
      sha256 "73112f16a05053303306ddace7bfaf272695a08a19f566c09b2d37880e989352"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-agent-darwin-x86_64.tar.gz"
      sha256 "9b9656ce77fe02397f0affb4c9bc5d62684137da17cb04b3434ae52d49d9e688"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-agent-linux-arm64.tar.gz"
      sha256 "fb724d5224ca585058ed466c7f2b3712df500e4ab6e8039b962453be944c14d3"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-agent-linux-x86_64.tar.gz"
      sha256 "d9d0c2994f2625a5342a33369fb839c150dfb302d6d3eb49ee305add13e4969d"
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
