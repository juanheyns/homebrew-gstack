class Design < Formula
  desc "AI-powered UI mockup CLI — generate, iterate, diff, and QA design mockups"
  homepage "https://github.com/juanheyns/gstack-design"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.1/design-darwin-arm64.tar.gz"
      sha256 "6c1cf66ddd030bc40f167ba16a61fac06bbf5740fe71d9a0544754b8e6c3dab2"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.0/design-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.1/design-linux-arm64.tar.gz"
      sha256 "0a1d2b51b7439966fe178e520154da182445ebf3b09b3be770c4b6ff586730ed"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.0/design-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "design"
  end

  test do
    assert_match "design", shell_output("#{bin}/design --version 2>&1")
  end
end
