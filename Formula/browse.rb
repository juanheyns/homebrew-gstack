class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.2/browse-darwin-arm64.tar.gz"
      sha256 "c06216e1747f3cf29b6f9a020affaf31108aaf2374c54a6306f9c2d9aafca3dd"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.0/browse-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.2/browse-linux-arm64.tar.gz"
      sha256 "63483410db98973213784723fccefb3b5c28ae98bfcdc63ecd93a896955c3df0"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.0/browse-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
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
