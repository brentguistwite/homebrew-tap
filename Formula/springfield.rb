class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.28.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.28.0/springfield_0.28.0_darwin_arm64.tar.gz"
      sha256 "a64fcbeaaef605aca6c480d472ebc55136e73cc7ca8865fdd1db03df390c9026"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.28.0/springfield_0.28.0_darwin_amd64.tar.gz"
      sha256 "259445dda80c05fb348afcd7a079e06377c16ff0f40fba2081977b84de889c50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.28.0/springfield_0.28.0_linux_arm64.tar.gz"
      sha256 "2884ab7e3f5fc1a9252e97e3d77297d002e3f8827733177add047a7c9dcaa44b"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.28.0/springfield_0.28.0_linux_amd64.tar.gz"
      sha256 "729424b7b8d0e4b9ff26fd1ebbb4c6a9108c273b262570cf2ae22159874d3416"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.28.0", shell_output("#{bin}/springfield version")
  end
end
