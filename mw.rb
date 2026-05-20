class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.17.0/a765e59/mw-v1.17.0-a765e59-darwin-x64.tar.xz"
  sha256 "0f784e5316cbf892466e9a5cdcfdc2bdbd8458c08f55adf9a776ee5ae62c2e7e"
  version "1.17.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.17.0/a765e59/mw-v1.17.0-a765e59-darwin-arm64.tar.xz"
      sha256 "a423366856cf44ec551dc3860bb480caafd2e305843385435c6a7ff04761b2f0"
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