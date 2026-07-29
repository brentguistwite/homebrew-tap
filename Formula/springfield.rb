class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.27.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.27.0/springfield_0.27.0_darwin_arm64.tar.gz"
      sha256 "1a03ab23532827d4fb24c98bb68c842e5fe0e5f2bc0accbc95e97bd75e2da261"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.27.0/springfield_0.27.0_darwin_amd64.tar.gz"
      sha256 "3e90dea3ba7ec896d751524758998a5cc9bce31344e54cfef4ad2d898881e23a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.27.0/springfield_0.27.0_linux_arm64.tar.gz"
      sha256 "bd65751ceefd922cdcb091f285d31eecb53a4059d7e829a244946a96b10bd604"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.27.0/springfield_0.27.0_linux_amd64.tar.gz"
      sha256 "5cfb4e728aba2b617e013b9c55fa6c2b14263bb534b8897755520dd5a42393a6"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.27.0", shell_output("#{bin}/springfield version")
  end
end
