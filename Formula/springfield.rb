class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.1/springfield_0.14.1_darwin_arm64.tar.gz"
      sha256 "189024cec404c540fa84959cd58dd964eb8c7d085b641b81f7fb35f28ca39983"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.1/springfield_0.14.1_darwin_amd64.tar.gz"
      sha256 "fd26ca0c752a78db33e9c27ec6aba3a8bea62f82916fd1c5031c2f107165d668"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.1/springfield_0.14.1_linux_arm64.tar.gz"
      sha256 "0a2a262dcdf681928252e923388d1aaa944429590ce981f462cb426975ab4e06"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.1/springfield_0.14.1_linux_amd64.tar.gz"
      sha256 "fca4c84d4bbd4a90ba99255e424e65725504251eea53abf9079ebf4b80e9febd"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.14.1", shell_output("#{bin}/springfield version")
  end
end
