class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.30.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.30.0/springfield_0.30.0_darwin_arm64.tar.gz"
      sha256 "671923ba81c365da77099f580930ff78c60a2f63e69ca195da617c1adf7f9b7b"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.30.0/springfield_0.30.0_darwin_amd64.tar.gz"
      sha256 "08e82531dc0d064f30838cf019dccdec747808d5b73eafa228b131236ef20490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.30.0/springfield_0.30.0_linux_arm64.tar.gz"
      sha256 "ac3d134e3c452ebe3b6deaf534b4004eeb0d33e967223582e911ab9d8a3490ba"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.30.0/springfield_0.30.0_linux_amd64.tar.gz"
      sha256 "300ac44c57dfce5f895e1c24e650d7a35cee988a9318f90f2a7def278b414d9e"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.30.0", shell_output("#{bin}/springfield version")
  end
end
