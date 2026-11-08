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
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.2/aisbx-0.51.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "ad1e09fd97fe5c1f1c3a84722713a0fa25bedab6818bc936bc9a32886bc65c03"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.2/aisbx-0.51.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "50b383f2abffdedd7ccf33d6734594f2a6196f3c26620191cd676058652023c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.2/aisbx-0.51.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f09a60ae980fafd4307b06e832aee0f7323905c2af00fb94535cdc3145c797d5"
    end
    on_intel do
      url "https://github.com/ilja82/aisbx/releases/download/v0.51.0.2/aisbx-0.51.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96d822804077d9ea09fded2453fa0c92884dc3f239e0507496d244357fd806a4"
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
