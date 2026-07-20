class Springfield < Formula
  desc "Plugin-first local CLI for Springfield setup and workflow control"
  homepage "https://github.com/brentguistwite/springfield"
  version "0.25.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.2/springfield_0.25.2_darwin_arm64.tar.gz"
      sha256 "ef852ab650cc9ebef01cd45307fec22a6ba6afe5208c1a1b65b22cb649e0518e"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.2/springfield_0.25.2_darwin_amd64.tar.gz"
      sha256 "98a27d1f1e46db0f6914a1bf108645596eb3cdfd96ce9bb18fb2a68afd8cdc9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.2/springfield_0.25.2_linux_arm64.tar.gz"
      sha256 "6d6fc375f8eecdc5653fa1e2f6a691c4115cb844974f841262aac5df05992b52"
    else
      url "https://github.com/brentguistwite/springfield/releases/download/v0.25.2/springfield_0.25.2_linux_amd64.tar.gz"
      sha256 "ae78a19aa79869fadfc5f35368b373b30f9e5789065c138b5c56543574e0beaf"
    end
  end

  def install
    bin.install "springfield"
  end

  test do
    assert_match "springfield v0.25.2", shell_output("#{bin}/springfield version")
  end
end
