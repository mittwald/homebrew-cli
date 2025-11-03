class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.12.0/e07a537/mw-v1.12.0-e07a537-darwin-x64.tar.xz"
  sha256 "7cefa6de8ae97cd0515173ec98aaaaa96936b33bf33a88fd0e5c90752a30fb6c"
  version "1.12.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.12.0/e07a537/mw-v1.12.0-e07a537-darwin-arm64.tar.xz"
      sha256 "596c166585142c2dde047c58baa7256e9cabf803ff0f00812ec7e47ce75d2728"
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