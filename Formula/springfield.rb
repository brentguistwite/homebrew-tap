class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.24.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.24.0/springfield_0.24.0_darwin_arm64.tar.gz"
      sha256 "6fcc73e6fabf4168de176d7d6bec3c4c4ddd83ba6e27ea0c13d9d36765ec8d5f"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.24.0/springfield_0.24.0_darwin_amd64.tar.gz"
      sha256 "b4a0bf97fc5d7c9e057620c167c8b33bdaf0a809968e64008212beb38d9a5ef2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.24.0/springfield_0.24.0_linux_arm64.tar.gz"
      sha256 "8ae0b26d11887009ea82f889055ab6d8f8e418a2476add55afeaa947f1b74305"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.24.0/springfield_0.24.0_linux_amd64.tar.gz"
      sha256 "0f3988cf3bae650088848f1c71d18ad3656b86bb8b86f6612f127f90ac7c2d43"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.24.0", shell_output("#{bin}/springfield version")
  end
end
