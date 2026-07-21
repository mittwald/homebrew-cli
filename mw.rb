class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.21.0/2bba718/mw-v1.21.0-2bba718-darwin-x64.tar.xz"
  sha256 "5feb0f8d14e3f546b2b7813f7575f5b8bce6fbdadfa958900d0470e28803e629"
  version "1.21.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.21.0/2bba718/mw-v1.21.0-2bba718-darwin-arm64.tar.xz"
      sha256 "189c49d2254b292ee5e767472202c260c5636b9a8f7cdedfea1ab79cd006c8d8"
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