class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.0/springfield_0.25.0_darwin_arm64.tar.gz"
      sha256 "c3eea9f86ccb96792086ea45d0de9a1c33f980f43882a420738bfceb582b5188"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.0/springfield_0.25.0_darwin_amd64.tar.gz"
      sha256 "14bfc48dce7c541b78e498fba96f5ad7ce7df8ba0a7d19fb7343edace42326ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.0/springfield_0.25.0_linux_arm64.tar.gz"
      sha256 "81438e69d0694639a237dc60911e8533bebc6c3e369608f73e6a6c5973453fd9"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.0/springfield_0.25.0_linux_amd64.tar.gz"
      sha256 "6dff2e0a37282191f46b1f915e43a02e5abda5886cea6df64d59f68a24428fa2"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.25.0", shell_output("#{bin}/springfield version")
  end
end
