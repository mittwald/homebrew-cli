class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.1/9f49d41/mw-v1.0.0-beta.1-9f49d41-darwin-x64.tar.xz"
  sha256 "15db962b4f3364c216414148da767f8c36f05cb2ea5ac01024a2d6034e208b5e"
  version "1.0.0-beta.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.1/9f49d41/mw-v1.0.0-beta.1-9f49d41-darwin-arm64.tar.xz"
      sha256 "2a5055ba1e9f7a29fc63db5d5158baeb677d4b325e0e612efe3ce1d818de23fb"
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