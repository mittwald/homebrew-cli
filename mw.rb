class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.20/3ec4cb1/mw-v1.0.0-alpha.20-3ec4cb1-darwin-x64.tar.xz"
  sha256 "b53741fc9a0133cce4d6d64a12102c97230bf8e2d221b85e6ef95f12fc0c85c1"
  version "1.0.0-alpha.20"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.20/3ec4cb1/mw-v1.0.0-alpha.20-3ec4cb1-darwin-arm64.tar.xz"
      sha256 "d67466f49195fc4f0c07e6833aa70b5b8b50f79e5c0712aef627e9730c9b2651"
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