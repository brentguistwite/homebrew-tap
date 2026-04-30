class BlackboxCli < Formula
  desc "Flight recorder for your dev day - passive git activity tracking"
  homepage "https://github.com/brentguistwite/blackbox"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.2/blackbox-cli-aarch64-apple-darwin.tar.xz"
      sha256 "ffac862f8586c13c8524cc0d249dec84d53ecf515ca37306828133d2c57d36c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.2/blackbox-cli-x86_64-apple-darwin.tar.xz"
      sha256 "cf8ad2c86b8caa568664b50be925007c675d2b2bd12d5b8f4ad42dfcad182a66"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.2/blackbox-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "58d68c75a2a6d0b9d14e73e2a32b9b9387033b4d53b8636dc59248d35475aec3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.2/blackbox-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "933cf9ae09e0a4735922cb1ef4f2e410d75becad685eec74255190fbc9d5703e"
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
