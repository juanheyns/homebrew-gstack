class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.2"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.2/browse-agent-darwin-arm64.tar.gz"
      sha256 "b1121c768af30d7d95e5b2d215b46494e05b2373c9ab66c230d3c7c75318ff46"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.0/browse-agent-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.2/browse-agent-linux-arm64.tar.gz"
      sha256 "b9cead6f80e59efc0962f6739e863790f7411f2423ad0539711265d3a18a9e4f"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.0/browse-agent-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
