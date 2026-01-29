class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.0/acf2c70/mw-v1.13.0-acf2c70-darwin-x64.tar.xz"
  sha256 "e4fb0ed135e327d9b266570df921388d2f52b941cd78e43fc3a0a032ac8d29d9"
  version "1.13.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.0/acf2c70/mw-v1.13.0-acf2c70-darwin-arm64.tar.xz"
      sha256 "2f2bb3ec42edd49319a6e27be392d67f602258a1e54a899d6d2b8d10138ea750"
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