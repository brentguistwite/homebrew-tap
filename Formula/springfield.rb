class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.20.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.1/springfield_0.20.1_darwin_arm64.tar.gz"
      sha256 "9afe8facc6f024fb6ba92c94086a0b12e17d1ba20d72df9804182f321677bee5"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.1/springfield_0.20.1_darwin_amd64.tar.gz"
      sha256 "1273118b79d95b1f51c6536d33957068f66a5edd8be3b45f0d998e1a928c4099"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.1/springfield_0.20.1_linux_arm64.tar.gz"
      sha256 "1d667c3b140cf2b8038c7b393f28771863fb5447554866086d6b46445a31d7ac"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.1/springfield_0.20.1_linux_amd64.tar.gz"
      sha256 "86993f2b0ceb0a83728540763da333eafe3a88cf5722262d02194c43d2d74621"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.20.1", shell_output("#{bin}/springfield version")
  end
end
