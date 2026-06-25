class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.18.0/4423ad4/mw-v1.18.0-4423ad4-darwin-x64.tar.xz"
  sha256 "cca92d7da96f3f28612a31b735d2f5f251ccde041ab9eec619b3232a6d249afd"
  version "1.18.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.18.0/4423ad4/mw-v1.18.0-4423ad4-darwin-arm64.tar.xz"
      sha256 "f6756a7c9608b0e0326da64c69eed98fe7ebd35bd6181f913e2e0b25ad662b43"
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