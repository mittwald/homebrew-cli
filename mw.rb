class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.2/c8da4d2/mw-v1.4.2-c8da4d2-darwin-x64.tar.xz"
  sha256 "1e1b388d97f0a4eb12bdaae2ee6a94ab9d01e9328a9291ad5a0830fff3324ac9"
  version "1.4.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.2/c8da4d2/mw-v1.4.2-c8da4d2-darwin-arm64.tar.xz"
      sha256 "46057e1992de1c92494a56eaa64cf6ea462f09641a47542dcdfa6e2ddbed327c"
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