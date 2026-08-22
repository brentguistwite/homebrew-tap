class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.31.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.31.0/springfield_0.31.0_darwin_arm64.tar.gz"
      sha256 "494b6745e7868579a9101a05421b601ae12a6ed1eecd02a084fc80ce8a1a9d60"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.31.0/springfield_0.31.0_darwin_amd64.tar.gz"
      sha256 "7c2fa6fe1c010ed4b41192d572c4670c19e74a067535e120b4c8a135b3f46804"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.31.0/springfield_0.31.0_linux_arm64.tar.gz"
      sha256 "765faafa5f823ed9aa3462e5d48e51b940d635339a6fed64234590692d15db5d"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.31.0/springfield_0.31.0_linux_amd64.tar.gz"
      sha256 "892a8544c95d7825c14488c1b366beeca39f2d205877107514571850a7d58e1f"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.31.0", shell_output("#{bin}/springfield version")
  end
end
