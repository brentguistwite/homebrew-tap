class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.15.0/springfield_0.15.0_darwin_arm64.tar.gz"
      sha256 "6b16eed8b80a572f0fc8cbfb38a29cbf070f793e20337ead8d0f723af52253f8"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.15.0/springfield_0.15.0_darwin_amd64.tar.gz"
      sha256 "1f644a50accd06cde99ec0fd5a281ef0b6aafcaa748bdd1b74ca833b08287deb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.15.0/springfield_0.15.0_linux_arm64.tar.gz"
      sha256 "fc4e5e1d1ee2f1497a8f12e691072e2119590ed1d733ef38bb2bb3d2e12087cf"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.15.0/springfield_0.15.0_linux_amd64.tar.gz"
      sha256 "dfac211ae4eecc2ca6edf6720f7bc2a57ed3c6d1c35fb2deff1d132fa58949f8"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.15.0", shell_output("#{bin}/springfield version")
  end
end
