class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.1/9f49d41/mw-v1.0.0-beta.1-9f49d41-darwin-x64.tar.xz"
  sha256 "8f55ec2c28eb4cd56d5b9f553cbe3b88d4738d52616f4a6f2dc88e1903ba773e"
  version "1.0.0-beta.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.1/9f49d41/mw-v1.0.0-beta.1-9f49d41-darwin-arm64.tar.xz"
      sha256 "002db5d6e4b1f8c08d57390fe7ee381e703d895b1a25bae2fc105bad106eb5b5"
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