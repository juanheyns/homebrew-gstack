class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.21"
  license "MIT"

  depends_on "juanheyns/gstack/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-darwin-arm64.tar.gz"
      sha256 "4fd5e66507126b1b4e76f6d997eb94fd70873f755f79cad1fcc1f0ba44db1c61"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-darwin-x86_64.tar.gz"
      sha256 "b17f314620939cc4157764434a32d731bfe17f6cd9e9376a7394957cba3c5e04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-linux-arm64.tar.gz"
      sha256 "f08140253cd915baf742f1a357a9f684e1d417071cff6140102cefb13c87a9b9"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-linux-x86_64.tar.gz"
      sha256 "1907760771c5a193e42632a8df68379df30de0b1b2d8a364e3f42ae6294a5145"
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
