class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-darwin-arm64.tar.gz"
      sha256 "a4374437c7c92c6dbea048fbb2aa99d951f4b13595c1d38f7ff3277b9777784b"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-darwin-x86_64.tar.gz"
      sha256 "8161d1635bf0f86f33774315f36c1933d8535ee0eafd4b6981d8e561654e346a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-linux-arm64.tar.gz"
      sha256 "d88ae071a85e6c0c9c88e9ecd049be513d2c58e92feb905400c5c4a2ce1e91f7"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-linux-x86_64.tar.gz"
      sha256 "15ceb464a177984d14ff7bfd497276e199bbc864faecba5f4b7cb2074279a2af"
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
