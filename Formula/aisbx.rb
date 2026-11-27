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
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.2/aisbx-0.54.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "d94a56c02670856ddb11ffc50b8cc13390dd07e3a1dcf639b5cc98ca4d95d5b2"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.2/aisbx-0.54.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "911233b3291461eb531672f7355d75db450a91c6730920b03479c55b8b572032"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.2/aisbx-0.54.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20d888d37ce0946df97d5923b732a36a268f44096bf024cbaad849f658ae0c99"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.2/aisbx-0.54.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "582339e35eb9a50bce832bbc9c0e385f205ea94da1f98d3527ea4061a7f7d4c2"
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
