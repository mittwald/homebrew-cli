class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.0/b90a99a/mw-v1.2.0-b90a99a-darwin-x64.tar.xz"
  sha256 "16a6eb39c53e7d9a25856112b3669d2e6572d951c6239787866b1f7202c2da92"
  version "1.2.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.0/b90a99a/mw-v1.2.0-b90a99a-darwin-arm64.tar.xz"
      sha256 "73529b553f634d63d7386ef2b115209ad87f2f73aa68c36e66220bdaf2be731b"
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