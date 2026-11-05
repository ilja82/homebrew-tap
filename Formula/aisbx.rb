class Aisbx < Formula
  desc "Run coding agents in Docker Sandboxes on your own accounts and gateways"
  homepage "https://github.com/ilja82/aisbx"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.1/aisbx-0.51.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "21a0b1d3e441fabdc96e8ff92a925c2e8977c6411f65575c2d220adf8b770bfe"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.1/aisbx-0.51.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "8c0518baa051bcc0c7e80d1876b9a6dd0fbb0a34bb1b11dab848e2634b79cbc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.1/aisbx-0.51.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02a1aad3476adfa8e400124431012cc303ee63d8bbc66f6680d40dedcf0a76ba"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.1/aisbx-0.51.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2166bb87e823c3a165dc8770315b6fe5f8e8b2af13022f256cce99927790d25"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/aisbx", libexec/"bin/aisbx-ui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aisbx --version")
    assert_path_exists libexec/"kits"
  end
end
