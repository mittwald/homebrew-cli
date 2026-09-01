class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.24.0/868749b/mw-v1.24.0-868749b-darwin-x64.tar.xz"
  sha256 "5a3306fd5a4cd45ecb80660f185d81ad7dc8225f19aef6b598a17a0b86fb2b51"
  version "1.24.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.24.0/868749b/mw-v1.24.0-868749b-darwin-arm64.tar.xz"
      sha256 "fb40e0a5e734ae153f7d18f40a13c5f4bc0fc0024b299beee9c653924e1337cb"
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