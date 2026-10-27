class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.28.0/89950d3/mw-v1.28.0-89950d3-darwin-x64.tar.xz"
  sha256 "2f4a569805af5323a3d95409259fdb4f0e4cc27ca9c572f21b5777755140aedd"
  version "1.28.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.28.0/89950d3/mw-v1.28.0-89950d3-darwin-arm64.tar.xz"
      sha256 "7d75d8b39f8fb2e4b62be2b47d4307d8407de006d36f11a306abc9a86f3c790d"
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