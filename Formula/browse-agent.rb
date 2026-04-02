class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.11"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-agent-darwin-arm64.tar.gz"
      sha256 "219501b49a5a864b9166bfe62474d751c16de0eb8b7cae43b4639cc8712df87c"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-agent-darwin-x86_64.tar.gz"
      sha256 "9d4d3abe2f85874b5c8dd5a714510aba1f9666828a32a1abbcde3f5e0ddcb8db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-agent-linux-arm64.tar.gz"
      sha256 "47703988a1ea7d9da76bd68d3b54dd53171f6c609541d3dd4c1f309c9804c19a"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.11/browse-agent-linux-x86_64.tar.gz"
      sha256 "f1353a8034dce0ebb4628e209e4466761818f4f20d98d78f33d220e166e4f48f"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
