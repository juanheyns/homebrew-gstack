class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.10"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-agent-darwin-arm64.tar.gz"
      sha256 "31455f4b0bb61c3b94b588ffe88e8c25e9d111268729b1de8048481829a44004"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-agent-darwin-x86_64.tar.gz"
      sha256 "a46f81e15006eb03c12ebc0a88ddfb5a2f35e58969c5eea2b23e9ae908a42ada"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-agent-linux-arm64.tar.gz"
      sha256 "9c3b8436b1547a11a48020156e13f07df9444beb8c7ab3d9036da283b8926511"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.10/browse-agent-linux-x86_64.tar.gz"
      sha256 "6a145245a7373743752754b415e2faf0f8fd46a2975109267b95abeab9252c46"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
