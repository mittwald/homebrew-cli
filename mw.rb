class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.24/3dbe2d1/mw-v1.0.0-alpha.24-3dbe2d1-darwin-x64.tar.xz"
  sha256 "233c1c339919392a62bd79d96a5869beb9e05ca57d954d2fdb907bc9092789d7"
  version "1.0.0-alpha.24"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.24/3dbe2d1/mw-v1.0.0-alpha.24-3dbe2d1-darwin-arm64.tar.xz"
      sha256 "7d271c61ee3a6ffe0d696c84c1be1f645f1205028a21d051264e86a5ca0ea7b3"
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