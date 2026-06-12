class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.21.0/springfield_0.21.0_darwin_arm64.tar.gz"
      sha256 "6c4e37d88007e6822ad4f520065e100057b6cd222b7be96039660b3381f48820"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.21.0/springfield_0.21.0_darwin_amd64.tar.gz"
      sha256 "7e2c21d8a933f6d634744aae181712cc0bead36c456eacba5b37f989ebe42831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.21.0/springfield_0.21.0_linux_arm64.tar.gz"
      sha256 "20500f763b0f8ab206869ac999879ac6e6b052a5e5a65591c363dca0fefff4f8"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.21.0/springfield_0.21.0_linux_amd64.tar.gz"
      sha256 "07f053e9efa590704c0188cb4c0eb28377a3694214971d414424824e66bd0c9b"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.21.0", shell_output("#{bin}/springfield version")
  end
end
