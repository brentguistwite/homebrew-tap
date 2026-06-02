class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.20.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.0/springfield_0.20.0_darwin_arm64.tar.gz"
      sha256 "672cbb7b8b432cb09f1a2f4ea18dc36977a23f6029fce6fdc573e3fef496fc42"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.0/springfield_0.20.0_darwin_amd64.tar.gz"
      sha256 "f9387883081e8bf4ecda43fa7b652956c6d64d10d4fb18ff0464c3d15a723157"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.0/springfield_0.20.0_linux_arm64.tar.gz"
      sha256 "3a7c49a6473e56ec3f9d22638d87d91f24d2ff5fd163feb21dabe2760c076ff8"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.20.0/springfield_0.20.0_linux_amd64.tar.gz"
      sha256 "88ba976ab14fe21236180f95ec9f7eca45498ce9861ca5ba9599839a4dc72ba6"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.20.0", shell_output("#{bin}/springfield version")
  end
end
