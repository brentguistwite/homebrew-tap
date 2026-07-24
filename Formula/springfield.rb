class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.26.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.26.0/springfield_0.26.0_darwin_arm64.tar.gz"
      sha256 "01f84b5378044f8e3a35062cfac172066329f53865e38d9e458ce1d39eaf6fd2"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.26.0/springfield_0.26.0_darwin_amd64.tar.gz"
      sha256 "d03f4d133c7c9d45269603c4e6478a7f50c5404bdc6e548eab7d89fb574544ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.26.0/springfield_0.26.0_linux_arm64.tar.gz"
      sha256 "c14b15c9f6b9b40603030de2c8e34388b94367a5ae2bc39ac7d3378a2e7fc7bf"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.26.0/springfield_0.26.0_linux_amd64.tar.gz"
      sha256 "19e1f5142617286a6680a124c737127cfb2565e5c3c5e5e83a67156c4e00b552"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.26.0", shell_output("#{bin}/springfield version")
  end
end
