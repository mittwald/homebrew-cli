class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.26.0/dfb7504/mw-v1.26.0-dfb7504-darwin-x64.tar.xz"
  sha256 "1d66caf69dfbd4075f5bc0ebdbfc90ea02850dcc6a6d6595c528055dd9059f7d"
  version "1.26.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.26.0/dfb7504/mw-v1.26.0-dfb7504-darwin-arm64.tar.xz"
      sha256 "801d9b2253d1dfb4487d01d964092230be863e0d3ac08c6452e77f8a32162d44"
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