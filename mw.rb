class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.5/91cedbe/mw-v1.2.5-91cedbe-darwin-x64.tar.xz"
  sha256 "d9820546714a10617930fa8100f4c6c357e08a8c94f577975054aec765ec597f"
  version "1.2.5"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.5/91cedbe/mw-v1.2.5-91cedbe-darwin-arm64.tar.xz"
      sha256 "5eee9ac2f15be0d1b0fc16e34a42ca338f5075452b3db999cdc86a4228a7aefe"
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