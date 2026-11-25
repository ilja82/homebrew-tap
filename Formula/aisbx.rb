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
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.0/aisbx-0.54.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "9e6e426f637bd43758ffe1c5ce52b12aa4fd614e2a6620d44b62d0f88d13fb58"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.0/aisbx-0.54.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8686f05d39036409e5dd2d93a3cd96dbc0641387dc28a66b39a04dff4c65a255"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.0/aisbx-0.54.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "642e253104f7933fda55cfb4c90309dce649e89e7824793850d337720ec84384"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.0/aisbx-0.54.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7980c46818b7955eb6a879dfda69521ec114bb6882c54445d780fdebfef21a92"
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
