class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.29.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.29.0/springfield_0.29.0_darwin_arm64.tar.gz"
      sha256 "dcad8603c9f4db09b57362446d584d314762ecf1d5ef3eb4734589d78498ee8f"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.29.0/springfield_0.29.0_darwin_amd64.tar.gz"
      sha256 "6896beb425036dbb15d3c78ae4a9b19bd541f76c9f8c0826d5949873f3bf68bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.29.0/springfield_0.29.0_linux_arm64.tar.gz"
      sha256 "66e3e8feb71b85c1ab5d31bb536fe1d082bfc7d7e0890debcea572802c352946"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.29.0/springfield_0.29.0_linux_amd64.tar.gz"
      sha256 "b4c4b0e934066fd857dbf2f04d1e5d5f8f6ca4e54c2a65fd34b41e6c3c812e2d"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.29.0", shell_output("#{bin}/springfield version")
  end
end
