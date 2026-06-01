class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.18.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.18.0/springfield_0.18.0_darwin_arm64.tar.gz"
      sha256 "bcbdaeac0561387c0d61214ed1beffab961d9570ecda68a7cd79f22933098dbb"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.18.0/springfield_0.18.0_darwin_amd64.tar.gz"
      sha256 "7b97a7de0a2cc1909b9a3151a84fcb556c809d65a59e5c666f59324b7bdcad99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.18.0/springfield_0.18.0_linux_arm64.tar.gz"
      sha256 "f0abeaaf97af1a43c28911e16f1a46d44af22c97e3e2329d32cf8ede047d4387"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.18.0/springfield_0.18.0_linux_amd64.tar.gz"
      sha256 "2dc8dd5ed4f9781e3710587c41fc5a5fe9e021d061263e9eeb75045ff30f8300"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.18.0", shell_output("#{bin}/springfield version")
  end
end
