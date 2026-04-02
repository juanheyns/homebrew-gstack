class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.4"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-agent-darwin-arm64.tar.gz"
      sha256 "d4facd98507c372fb949bf0a8ec3d3047b6e88bcad6de151351f53e5887b3125"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-agent-darwin-x86_64.tar.gz"
      sha256 "2085ec777e00b77561082dd5f8adf0fa65687b7fd972aed3898ab8d24be28153"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-agent-linux-arm64.tar.gz"
      sha256 "a0800c8c9a81de8db8faae6ca5d03ce108fc22e82338a53c16f4e92b229183aa"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.4/browse-agent-linux-x86_64.tar.gz"
      sha256 "d56edcabe60ab9755f80d52dbc97b432eeaa4e56e0e55374b2b3c3ecff9ea36f"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
