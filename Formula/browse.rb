class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-darwin-arm64.tar.gz"
      sha256 "676059924705c93cfa40e3dd072213b3c8d1beddf53cbdde0ed4a53ec05b2c90"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-darwin-x86_64.tar.gz"
      sha256 "7b09af7c0a85deeb2019827624741c71f1a516b47e57255bccd822afe7c5c018"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-linux-arm64.tar.gz"
      sha256 "adfe1b8e6a64a7919ee956612d8bae68210bb3319599c55f8ec73a246f77e22c"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-linux-x86_64.tar.gz"
      sha256 "2cee12757a8483d6455514349b84585dded6f0fbece1f49a58b95d2b2d9ecd25"
    end
  end

  def install
    bin.install "browse"
    bin.install "server.mjs"
    bin.install ".version" if File.exist?(".version")
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
