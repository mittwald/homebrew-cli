class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.23.0/0bd60ab/mw-v1.23.0-0bd60ab-darwin-x64.tar.xz"
  sha256 "6c5e8e52e5cc10ec563e40ee939e4901594e5366f098fa785c61c386d2b0b70d"
  version "1.23.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.23.0/0bd60ab/mw-v1.23.0-0bd60ab-darwin-arm64.tar.xz"
      sha256 "6d49a3111c1d14379984434d168b6d2192b33d258e8726cfb1f7edd137d0ffea"
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