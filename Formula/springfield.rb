class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.16.0/springfield_0.16.0_darwin_arm64.tar.gz"
      sha256 "50a1243f5e9369334189c95709cdbc19447de96ef8381fe5aa5627f99396f588"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.16.0/springfield_0.16.0_darwin_amd64.tar.gz"
      sha256 "8741f36b50b913de591e45b81ec08167eb4e4b2a5df12f42c4db1429e5143f28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.16.0/springfield_0.16.0_linux_arm64.tar.gz"
      sha256 "f59d4bf4875ced866c27360591544431966e7e44739fead412ff6ce6d2d593f3"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.16.0/springfield_0.16.0_linux_amd64.tar.gz"
      sha256 "bfff9b93f54da6a08317effc5f7d3239cd08c381a9e254be1b9c50f427dfb837"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.16.0", shell_output("#{bin}/springfield version")
  end
end
