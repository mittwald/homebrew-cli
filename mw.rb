class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.3/37d6a93/mw-v1.13.1-beta.3-37d6a93-darwin-x64.tar.xz"
  sha256 "a39aa4b40157010782ec906a00a89cba5b803336f3873f57f40efa7d8c56228f"
  version "1.13.1-beta.3"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.3/37d6a93/mw-v1.13.1-beta.3-37d6a93-darwin-arm64.tar.xz"
      sha256 "8a2a6cd248d7663071c7620193b72ec639ab281efb9ad1f7e97e287e4512d875"
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