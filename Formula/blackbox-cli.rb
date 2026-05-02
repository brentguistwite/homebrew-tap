class BlackboxCli < Formula
  desc "Flight recorder for your dev day - passive git activity tracking"
  homepage "https://github.com/brentguistwite/blackbox"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.3/blackbox-cli-aarch64-apple-darwin.tar.xz"
      sha256 "1ce520e52333d6630cbdce1a472c5ab128daeaeea48d5329964219607c463e14"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.3/blackbox-cli-x86_64-apple-darwin.tar.xz"
      sha256 "f0d03531e0d20576fc72748fb30366a04f28cc25cb7e871ea2e5699eef76c1af"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.3/blackbox-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3b6656e12ed1a2479be00f1499e32f44f4ccb0c647de8290eeaaeb44bfdfc4b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.3/blackbox-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2d004718ab5c7f787836d5737a5a92beacc72c7a02592e04f6e43b216e2a38ee"
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
