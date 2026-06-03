class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.17.2/da2fb1d/mw-v1.17.2-da2fb1d-darwin-x64.tar.xz"
  sha256 "715156b9f21eba3f2dda2c05280777ee4863784a051a4edebba365e185134bce"
  version "1.17.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.17.2/da2fb1d/mw-v1.17.2-da2fb1d-darwin-arm64.tar.xz"
      sha256 "f9ee722f75d0ed8a3452d0f094310ac03bae25a73cc17a3cacfda94c710f781b"
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