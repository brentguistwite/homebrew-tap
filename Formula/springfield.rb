class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.14.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.2/springfield_0.14.2_darwin_arm64.tar.gz"
      sha256 "16accb50f8d4cfc26983a385abb87fc29cc5f11370fe4437895740db23b6f2fd"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.2/springfield_0.14.2_darwin_amd64.tar.gz"
      sha256 "8d2036b93666c0fa6ab76125e87d4cfa32978b80327259ec4513e891b5682057"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.2/springfield_0.14.2_linux_arm64.tar.gz"
      sha256 "439cd11d8d9b7780fb9a665e4cf0dda617756c87e7faf28c1f9f131219465ed2"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.2/springfield_0.14.2_linux_amd64.tar.gz"
      sha256 "8ba8e96fe7737f35c649221fb80c061f7ee1c6837d58855b84bec9339ffa7e44"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.14.2", shell_output("#{bin}/springfield version")
  end
end
