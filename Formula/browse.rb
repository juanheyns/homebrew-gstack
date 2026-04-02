class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-darwin-arm64.tar.gz"
      sha256 "6eb4a9482322ca94ea8072f6ba1ec349ed324dcb00a7f6f2faed02cda535a327"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-darwin-x86_64.tar.gz"
      sha256 "464741888d773d0c17ad163307179d9a1c6084cf7991a9a81a0483aae878b82f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-linux-arm64.tar.gz"
      sha256 "74de3b1b6548198faa78cd4da35a871fad4547c92b8913a0fdec5c7dd7c5728e"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-linux-x86_64.tar.gz"
      sha256 "26b05c954fb4b3221c776bfde933b7aa09096eb2c8f3aea0015d3a1f5e9a05cc"
    end
  end

  def install
    bin.install "browse"
  end

  def post_install
    if which("bun")
      system bin/"browse", "setup-chromium"
    else
      opoo "bun not found — run `browse setup-chromium` manually after installing bun"
    end
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --version 2>&1 || #{bin}/browse --help 2>&1")
  end
end
