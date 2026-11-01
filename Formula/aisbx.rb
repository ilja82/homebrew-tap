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
      url "https://github.com/ilja82/aisbx/releases/download/v0.50.1.0/aisbx-0.50.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "66a3853baa0a6be91ab30002af0f757264b88d6bd71be0ef56daba41605b9fc2"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.50.1.0/aisbx-0.50.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "287de7fd6b313fa7de871b1754a8e3b0367f9d1aa86ce55b6bb8bbc184785677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.50.1.0/aisbx-0.50.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c20afa3e911bd6097ce94f1055597bda1c9b29977b1148d5a0f3cc3d68908ef"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.50.1.0/aisbx-0.50.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f98681004c8c458d342207d98ef0dee4aed5053b2d48e5b89ded5bfe3c9acd98"
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
