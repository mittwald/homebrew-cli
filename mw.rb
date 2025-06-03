class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.3/2d5fe23/mw-v1.4.3-2d5fe23-darwin-x64.tar.xz"
  sha256 "40314e5c788811701dfd1c748c0111e63db609296b0b95015823bdaf12dfae73"
  version "1.4.3"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.3/2d5fe23/mw-v1.4.3-2d5fe23-darwin-arm64.tar.xz"
      sha256 "85f14ea1e3f1ea773b6fb4837f65824d2f9d201f05d196987040e858e809a349"
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