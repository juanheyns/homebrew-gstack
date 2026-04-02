class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-darwin-arm64.tar.gz"
      sha256 "071fbb9dfa61d019bf81a5160d929ff7b9a941137f019a86a6d46280ca7afd36"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-darwin-x86_64.tar.gz"
      sha256 "5fcc6fdd1fd9afa1cb813488f36f7605313eb46dee510b8c17f65a36e0695a99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-linux-arm64.tar.gz"
      sha256 "54b3fc13bbc81e49d25d6d0818f118d7ffba51d63e9ae5224cde6dba6df79396"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-linux-x86_64.tar.gz"
      sha256 "08cd0418d05d22ce02d71b48582d266576924af1149fa660caeaee4e1b1267ae"
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
