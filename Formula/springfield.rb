class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.25.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.1/springfield_0.25.1_darwin_arm64.tar.gz"
      sha256 "ae891cd7d7d5ecc1c9c2a24528f84c6ae32cf0cbdc76a340322ec575dc53811f"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.1/springfield_0.25.1_darwin_amd64.tar.gz"
      sha256 "31fd325d80764a60b170fb5479c326749a314b9006804f1d03fe2cde0a841c7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.1/springfield_0.25.1_linux_arm64.tar.gz"
      sha256 "6e2b6a6d917d1ca7af6e44534a5253380f8c18025891b596a8669d45eb6a34ae"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.1/springfield_0.25.1_linux_amd64.tar.gz"
      sha256 "7a316e81e29df1631056abe208cafed979384105f2802f7c8810b30fb27d6195"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.25.1", shell_output("#{bin}/springfield version")
  end
end
