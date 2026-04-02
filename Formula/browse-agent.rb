class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.12"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-agent-darwin-arm64.tar.gz"
      sha256 "df3b1e8c23b5cda6081a7ff9589cf427e974465eb0e73aee512e7208f9193f00"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-agent-darwin-x86_64.tar.gz"
      sha256 "fcfb20d2ae8fa9fb288672183ab3a28b5d05addeb809108b24bdf6ea55b77455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-agent-linux-arm64.tar.gz"
      sha256 "241af0e19b802e6fcb8c874df70ae3fd407db9342f7d14bd6bbd88ccc81a11c6"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.12/browse-agent-linux-x86_64.tar.gz"
      sha256 "3b172cd960702705591e68de58a729afab6d01eb882eaac73108a95163ab2ce8"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
