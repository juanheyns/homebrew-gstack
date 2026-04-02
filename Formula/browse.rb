class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-darwin-arm64.tar.gz"
      sha256 "deed4be64d61b8684eb79af36121b832fce7ec83b8f99d35f62d5f4c27f34d00"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-darwin-x86_64.tar.gz"
      sha256 "eb75bcff77a54b0c75b4e8168d6535e2cd6bf3951771a115202c36886371b78b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-linux-arm64.tar.gz"
      sha256 "dd4f1b62a120709a33a6e160240f19518c04045c072ce5f2f3e0f9cc845cba05"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-linux-x86_64.tar.gz"
      sha256 "f27544e6ff985c7d4b696ba49a13fba05b82b4d0ac53bab679a853b034263523"
    end
  end

  def install
    bin.install "browse"
    bin.install "server.mjs"
    (share/"browse").install "extension"
  end

  def caveats
    <<~EOS
      To finish setup, install Chromium:
        browse setup-chromium

      Requires bun (https://bun.sh). Install it first if you haven't:
        curl -fsSL https://bun.sh/install | bash
    EOS
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --version 2>&1 || #{bin}/browse --help 2>&1")
  end
end
