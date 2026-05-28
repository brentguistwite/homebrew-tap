class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.0/springfield_0.14.0_darwin_arm64.tar.gz"
      sha256 "b6ef86abf74217e01e8fa293988fabd2ff76e7424282559135f39b17418a9a7c"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.0/springfield_0.14.0_darwin_amd64.tar.gz"
      sha256 "7c3ab64e487791609c17d35786a2a1def3c5568cbc3afbcea9eae1de7076b304"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.0/springfield_0.14.0_linux_arm64.tar.gz"
      sha256 "c7bcd05fac80317eb55674639ae1a706964400218fa996d9ec51fce40f27eee8"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.14.0/springfield_0.14.0_linux_amd64.tar.gz"
      sha256 "c9e1476daa82d82b41d1f8552a9bf2175e37c373b3eab6502a778e6f2982b57b"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.14.0", shell_output("#{bin}/springfield version")
  end
end
