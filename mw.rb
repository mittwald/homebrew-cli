class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.2/fbf30cc/mw-v1.2.2-fbf30cc-darwin-x64.tar.xz"
  sha256 "456fd5681fee58e0a54ebd79b4ef05c699ad7d715ad94b27ad771c9b5757937a"
  version "1.2.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.2/fbf30cc/mw-v1.2.2-fbf30cc-darwin-arm64.tar.xz"
      sha256 "4eb0c498ed6fec096d40a7ecc8cbcb0002c8209a873fad7fd9fcceded559e6c7"
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