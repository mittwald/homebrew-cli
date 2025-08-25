class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.8.1/320378d/mw-v1.8.1-320378d-darwin-x64.tar.xz"
  sha256 "3fabe31e62ac811bcd1218b7e577b7a172947d23f4eecdf6dac4b8faeed9107c"
  version "1.8.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.8.1/320378d/mw-v1.8.1-320378d-darwin-arm64.tar.xz"
      sha256 "a3af658f4890eb943e69e17bfe805988995194c29656bde35882a28326df80ad"
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