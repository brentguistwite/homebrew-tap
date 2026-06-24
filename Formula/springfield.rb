class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.22.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.22.0/springfield_0.22.0_darwin_arm64.tar.gz"
      sha256 "69422b25e62115392716565f3dfc218d3bde007aef7e038c862d1dc07c9bf25a"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.22.0/springfield_0.22.0_darwin_amd64.tar.gz"
      sha256 "333dafc905f9b209cab2ffeb7ab9444f53966176aada1b8a9f74df4c357ffa00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.22.0/springfield_0.22.0_linux_arm64.tar.gz"
      sha256 "33bb1edf9c792701d708c4542ec16217eaa4ec0039cc8f073ecb41856a0d762a"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.22.0/springfield_0.22.0_linux_amd64.tar.gz"
      sha256 "cda1079adfd15c0b66279289bf0e142ed6ecaae75493c57380079bcdb77b9442"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.22.0", shell_output("#{bin}/springfield version")
  end
end
