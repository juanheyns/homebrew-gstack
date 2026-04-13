class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-darwin-arm64.tar.gz"
      sha256 "799d177c2267a3a07688f90428bf3b5de9f15523acecff73a99ec72254a2aaf7"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-darwin-x86_64.tar.gz"
      sha256 "7936025d205f2365bfccc87bfc9fc95617deb126137d280dcc0485a4f2aac78d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-linux-arm64.tar.gz"
      sha256 "4009acd532de1c591f155b556172feb04210a4601b3e866d48a5e31f5e224432"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.17/browse-linux-x86_64.tar.gz"
      sha256 "97a1464440be07a63421d44583205390ab153f40f33924328ddc295d58a2b682"
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
