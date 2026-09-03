class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.24.1/5e8f7b2/mw-v1.24.1-5e8f7b2-darwin-x64.tar.xz"
  sha256 "f1f33e1ba49490f323ce835d9b37b1d05437af3d5453c0671553c1b170e3d859"
  version "1.24.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.24.1/5e8f7b2/mw-v1.24.1-5e8f7b2-darwin-arm64.tar.xz"
      sha256 "c84a5f66f69314805ca2ce937e30a191c000ef631d2208261a06c0cbb49130d3"
    end
  end

  def install
    inreplace "bin/mw", /^CLIENT_HOME=/, "export MW_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mw"
  end

  test do
    system bin/"mw", "--version"
  end
end