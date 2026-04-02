class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.13"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-agent-darwin-arm64.tar.gz"
      sha256 "07370594193138c6d80b991c4476de7294a52b06896b50b07c8741fff34550c7"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-agent-darwin-x86_64.tar.gz"
      sha256 "9c7b0bf0b5e59b100728bef49be0b73c0a9bc77a5c9ae16d215e98ba90405c7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-agent-linux-arm64.tar.gz"
      sha256 "6970a49a3ee53de257f8c66c825b10987917b98acd3420db1ba5398d253ace30"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.13/browse-agent-linux-x86_64.tar.gz"
      sha256 "f6679b69f1537ad961b762cc4740924d0d0a959a53e8c499ba48e7998501a4e4"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
