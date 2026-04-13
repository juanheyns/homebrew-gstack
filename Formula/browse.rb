class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-darwin-arm64.tar.gz"
      sha256 "c56983dbddeb5c950f9c8648c912a491017d2b9cab8f0674007fa996145791b1"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-darwin-x86_64.tar.gz"
      sha256 "83c5aea67bf8d2ead5b483db9dd3ef325216c0f13b7920764113ccb713bbdc96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-linux-arm64.tar.gz"
      sha256 "344368dde41adb39b709630c55a36727866f18be49b2e1d0cbddc73532f07b08"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.20/browse-linux-x86_64.tar.gz"
      sha256 "bc9a880827a7b5bd4aa48984a529692cc1af3818b812e6e302e2a80a3dd95d34"
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
