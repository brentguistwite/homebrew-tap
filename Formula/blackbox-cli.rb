class BlackboxCli < Formula
  desc "Flight recorder for your dev day - passive git activity tracking"
  homepage "https://github.com/brentguistwite/blackbox"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.0/blackbox-cli-aarch64-apple-darwin.tar.xz"
      sha256 "a96f64d01624655bc46a4a514558294bfd7c3790cd99d32918990d4a3a8a7217"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.0/blackbox-cli-x86_64-apple-darwin.tar.xz"
      sha256 "0e3e3b2ef056b7a09f9c1422e71c2681a6dff10228e76754e0e4d56a6a6649ae"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.0/blackbox-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "18629be190b3ca62ba4a6570ecd5f4105db8743103dcf97c2fec44691ab254c3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.0/blackbox-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "94cfe30b8157a40f9000b439ca45543b79ab2bb0843197646b3d2a8118e4bbd5"
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
