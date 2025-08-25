class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.8.0/09a299d/mw-v1.8.0-09a299d-darwin-x64.tar.xz"
  sha256 "c714796bf7c79a2cd258f203326b50fce323374a48f1742e97e5c4e8e15bd463"
  version "1.8.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.8.0/09a299d/mw-v1.8.0-09a299d-darwin-arm64.tar.xz"
      sha256 "3c6fbb86eb5ef36e0b5172171fcfd4d5624ed11e1333537f6626a31b1bc210d8"
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