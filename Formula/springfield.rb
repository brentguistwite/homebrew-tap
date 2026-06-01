class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.17.0/springfield_0.17.0_darwin_arm64.tar.gz"
      sha256 "aace5474cf774ca87084859399a9829662e544b13ab4402b43b87b1c5f6dfd0a"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.17.0/springfield_0.17.0_darwin_amd64.tar.gz"
      sha256 "54378e0b9fd7eb2ea97cdd6d8222815366759788350039792771bb978087eb4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.17.0/springfield_0.17.0_linux_arm64.tar.gz"
      sha256 "78b9df4a9ae667ca657bea3359068881472e61ee6dd5de31022271ed665010b9"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.17.0/springfield_0.17.0_linux_amd64.tar.gz"
      sha256 "5ecbbd6dccb016782c8505ced19cab9abb0ae9fbcebf2162b18b0e6c048ca7ad"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.17.0", shell_output("#{bin}/springfield version")
  end
end
