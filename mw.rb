class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.9.0/0317a3a/mw-v1.9.0-0317a3a-darwin-x64.tar.xz"
  sha256 "f499a5163457197641e343131c48a1ead571bd0c062edffcc915355b5c9b35b3"
  version "1.9.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.9.0/0317a3a/mw-v1.9.0-0317a3a-darwin-arm64.tar.xz"
      sha256 "343bb6346d07ebd5e8a745e674fd582d71d60258f8484af23ad9a5df2f2833ba"
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