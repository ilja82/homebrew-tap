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
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.1/aisbx-0.54.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "30c762b975f8009859b86e4665b8fe9cb2dd32b523b73a990aa0d6150037556f"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.1/aisbx-0.54.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "b7b109fbf1507497b3f666164ec86d1e069a9e7bf8e672160953a60926d5ee6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.1/aisbx-0.54.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8dd242e32da11ec4f6533ddccf7770a074824c693bf17b6a23dc12cb57738bb"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.54.1.1/aisbx-0.54.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b488e960dd88af4ff1ba6250db2ededf48ae1ce3c5733ada57dda02ce4d4baab"
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
