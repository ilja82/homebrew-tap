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
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.0/aisbx-0.51.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "e53d55aa30365fdc7261fb3f48ef36a3a07cebc8cf438b620de367391eb27270"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.0/aisbx-0.51.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "ca4a4f02b02836f42482bb441f986d170a8aa9d5d5c359efcf877dd2a8e2999b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.0/aisbx-0.51.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75df6b6ca2c90f5004a8a41472d392a4e48ab555eca0b88d7521cf6909829454"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.0/aisbx-0.51.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61c55a4d05e7549482c85c9868c4c4236716c91c0dae4cb6897aafd342b79b8b"
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
