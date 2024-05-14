class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.45/3756c89/mw-v1.0.0-alpha.45-3756c89-darwin-x64.tar.xz"
  sha256 "044befc4639b65144fe7052346f42664b2d21b37ad081be0f5f278c549e134f7"
  version "1.0.0-alpha.45"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.45/3756c89/mw-v1.0.0-alpha.45-3756c89-darwin-arm64.tar.xz"
      sha256 "e6b74bd2929b14d97ac7e75fc1f019ba011c9e6137c97524cf3430d3af363c19"
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