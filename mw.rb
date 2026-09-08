class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.25.0/f01821c/mw-v1.25.0-f01821c-darwin-x64.tar.xz"
  sha256 "25073c7d04aea63b58c41e58d5a722966cd4aeee030ea5114a363ad8c8066042"
  version "1.25.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.25.0/f01821c/mw-v1.25.0-f01821c-darwin-arm64.tar.xz"
      sha256 "fe49e501c2f84d20d1891ca6d751d1d7542d7dca20a0dc3f426ef549bfd9f057"
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