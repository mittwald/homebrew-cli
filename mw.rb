class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.27.1/d58344c/mw-v1.27.1-d58344c-darwin-x64.tar.xz"
  sha256 "555c16882ed3d32ea574030a71238423ff934126ecd51958a5e90177ee5c52a9"
  version "1.27.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.27.1/d58344c/mw-v1.27.1-d58344c-darwin-arm64.tar.xz"
      sha256 "c5dea26cce40a81c0cb0b4ab2ea436ddda05d1b3cf725f23204d7f9b2dcce193"
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