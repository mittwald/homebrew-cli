class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.17/6660ebe/mw-v1.0.0-alpha.17-6660ebe-darwin-x64.tar.xz"
  sha256 ""
  version "1.0.0-alpha.17"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.17/6660ebe/mw-v1.0.0-alpha.17-6660ebe-darwin-arm64.tar.xz"
      sha256 ""
    end
  end

  def install
    inreplace "bin/mw", /^CLIENT_HOME=/, "export HEROKU_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mw"
  end

  test do
    system bin/"mw", "--version"
  end
end