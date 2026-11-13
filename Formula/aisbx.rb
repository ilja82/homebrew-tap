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
      url "https://github.com/ilja82/aisbx/releases/download/v0.53.0.0/aisbx-0.53.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "78515ae4c70b4591c1be10515636c50b1e5b85ae10bc4d90b9acac77cdbbc31b"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.53.0.0/aisbx-0.53.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "92bb4090e66b6983e9f0fb9486cfeb0340b8099628614206c62b9058cd8cd115"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.53.0.0/aisbx-0.53.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b99ec17995ad0be81088c02d9507cef24506ec5623d84811b2e2712792c4ff9d"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.53.0.0/aisbx-0.53.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b63079561ed22fbf03e8dcd5860ef1ffe3fcfc150b919ea3103d6e110a4b6d32"
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
