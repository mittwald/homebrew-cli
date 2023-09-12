class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.22/08485ca/mw-v1.0.0-alpha.22-08485ca-darwin-x64.tar.xz"
  sha256 "88443846fe00f761f060678bce311030cb977c8c64a4f4244fa4fc92237c89ca"
  version "1.0.0-alpha.22"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.22/08485ca/mw-v1.0.0-alpha.22-08485ca-darwin-arm64.tar.xz"
      sha256 "ab08e8383cb149c290b25f999b906eee8318d5a36a59c2327c7eac33b459efd0"
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