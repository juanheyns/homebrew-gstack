class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.5"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-agent-darwin-arm64.tar.gz"
      sha256 "f6bb14c4a7e53e969543512a4a42e45d6ab7d5e4cb386eaa9b27a3b886680f7d"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-agent-darwin-x86_64.tar.gz"
      sha256 "34a8a34b334b0715e449425dddca557c24b87d6b2299fef8da2a83236a628136"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-agent-linux-arm64.tar.gz"
      sha256 "59a25efcac2e3d9de43925bc721055d6e7c6dfec1a21ec1a55a4bcde4859bc06"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-agent-linux-x86_64.tar.gz"
      sha256 "093bdbda58a4cd52e305561778be342d918e4e0c8628711e691137170a76cb26"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
