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
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.0.0/aisbx-0.54.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "63ba9138dbb533b8e0a95766369bd5e86797c343b326d83ba24792804c0f6cfb"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.0.0/aisbx-0.54.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "327482b97bcb7c2e5ec656cacb1d754d9e3c080e5d763d6f723cde01414fc435"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.0.0/aisbx-0.54.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8dc7168a43b8088c6670f5c2c77dc5f5e1cacce7cd1a542dd4343faa65719516"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.0.0/aisbx-0.54.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d5270b7e8a12c8facbfee02af55bc3b85e60fb91131adda10226c7fc8702490"
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
