class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-darwin-arm64.tar.gz"
      sha256 "f72bce87d3565a62c6b954c240ce07cf2dedf8bd21e4937ad82a6832ebd88820"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-darwin-x86_64.tar.gz"
      sha256 "66643dce5ea9fc142c89f35286f861f69c2bf8f851208299e5800cedc5355ca6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-linux-arm64.tar.gz"
      sha256 "1bbc8405844dafe204d59131d57ecf1d5671f053783c786dba40d24003b90840"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-linux-x86_64.tar.gz"
      sha256 "47135031c9487b4a7c7b4dce8a91029f78907fa9428d1705e5e44568f3a2f94c"
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
