class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.19.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.19.0/springfield_0.19.0_darwin_arm64.tar.gz"
      sha256 "6ea54e36daf05ef9aa141c2b6486f105d57fe916c94f2c42d7adcbc420345160"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.19.0/springfield_0.19.0_darwin_amd64.tar.gz"
      sha256 "015775a42148a031affb6d637a97d7f2c1df6ab4f1a296082d2eb0df2d5bccd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.19.0/springfield_0.19.0_linux_arm64.tar.gz"
      sha256 "e1ee442a0d8d8ede623ff355c577cf4683aa6674745420c87cdccb721c324f7c"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.19.0/springfield_0.19.0_linux_amd64.tar.gz"
      sha256 "2e1d3a441efd171f8eec649cd2bfb197493f125fdcb8863b306c79b27467eb93"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.19.0", shell_output("#{bin}/springfield version")
  end
end
