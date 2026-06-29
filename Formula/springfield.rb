class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.23.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.23.0/springfield_0.23.0_darwin_arm64.tar.gz"
      sha256 "5716da25a517aaeb8c5bfb10d1c69bf0f737146f3261dc6ac438476000fd0b5f"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.23.0/springfield_0.23.0_darwin_amd64.tar.gz"
      sha256 "0a731269906feac7c6bf7de131f57e3b43e7a748a5a87246e9e7cf7eccf88a48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.23.0/springfield_0.23.0_linux_arm64.tar.gz"
      sha256 "1136deb59bea447154a4a1ac71c626587c6c9c992a7d5c3657d26c55a06f4cd1"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.23.0/springfield_0.23.0_linux_amd64.tar.gz"
      sha256 "857aaf627cc403ae72e48ad74703ce972b97e9ff3d93e64bf9910ccfe3c3c9c7"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.23.0", shell_output("#{bin}/springfield version")
  end
end
