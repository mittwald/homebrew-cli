class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.32/ee488b3/mw-v1.0.0-alpha.32-ee488b3-darwin-x64.tar.xz"
  sha256 "67a6e4d7807996ddc127b22b20e31bb168ee320a3dd9dae386661ab7763df9e9"
  version "1.0.0-alpha.32"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.32/ee488b3/mw-v1.0.0-alpha.32-ee488b3-darwin-arm64.tar.xz"
      sha256 "a58e373c7cc34e964a5f2ac57428c931965fb0af5146f7b40fdeeeddf3fa0680"
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