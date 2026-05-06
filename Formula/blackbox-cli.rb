class BlackboxCli < Formula
  desc "Flight recorder for your dev day - passive git activity tracking"
  homepage "https://github.com/brentguistwite/blackbox"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.4/blackbox-cli-aarch64-apple-darwin.tar.xz"
      sha256 "08334fb5549c480bbc4737fc9bde890d2424ceef20709005acb9801d4dc39403"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.4/blackbox-cli-x86_64-apple-darwin.tar.xz"
      sha256 "cdc3d490733e1902fc11d4c92cb25d538e824e2ce66a0e3aa81f7af8308299da"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.4/blackbox-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a941ec19da61283a1513d9f0ce1c3ec361244547576eda4e86fb54530744b849"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.4/blackbox-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "199c1a868f1811ee22b97b2d41b947d4c595279acfb91b6d222517fd61f7e282"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "blackbox" if OS.mac? && Hardware::CPU.arm?
    bin.install "blackbox" if OS.mac? && Hardware::CPU.intel?
    bin.install "blackbox" if OS.linux? && Hardware::CPU.arm?
    bin.install "blackbox" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
