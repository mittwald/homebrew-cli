class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.4/8fe090a/mw-v1.4.4-8fe090a-darwin-x64.tar.xz"
  sha256 "07ccbe5b917900a82656dc941624f35bf4a73fb8a300ce3ee6389b2e474fbe76"
  version "1.4.4"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.4/8fe090a/mw-v1.4.4-8fe090a-darwin-arm64.tar.xz"
      sha256 "86ef4e8791a3103ba54b0476caf8faa775e5bfd4ba809b0da593044be6285c6a"
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