class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.30.0/c8cc16c/mw-v1.30.0-c8cc16c-darwin-x64.tar.xz"
  sha256 "383aa736d4224646a6258898a7b592af59040db69d7bec9aa998a21187ddf475"
  version "1.30.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.30.0/c8cc16c/mw-v1.30.0-c8cc16c-darwin-arm64.tar.xz"
      sha256 "c2856216b98789805a47493b189751ca2c6ec64b1da596239eeea878d3e29e2a"
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