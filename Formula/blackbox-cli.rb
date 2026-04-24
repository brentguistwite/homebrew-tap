class BlackboxCli < Formula
  desc "Flight recorder for your dev day - passive git activity tracking"
  homepage "https://github.com/brentguistwite/blackbox"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.1/blackbox-cli-aarch64-apple-darwin.tar.xz"
      sha256 "5b3159868eb5d0b7e1b25ada546cb5661eada7741ea7d89f0dd2fc84505a148e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.1/blackbox-cli-x86_64-apple-darwin.tar.xz"
      sha256 "e8b95e960a2eb177a8d6ca38e3b7d3d7c0e69df1b5fca54249b1bab5ddc7b6b5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.1/blackbox-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "32c02db274cc9f25092a30c71983f054a184f85d89b7f93d733a4783e22d4fb8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brentguistwite/blackbox/releases/download/v0.1.1/blackbox-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c5a8d894340887f0d8ff8975f1fb47cce66aa369522e2d33d2932934cbb10a62"
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
