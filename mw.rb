class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.28.1/e9660fa/mw-v1.28.1-e9660fa-darwin-x64.tar.xz"
  sha256 "733b347c5eaf45895f5950234a16f0dc4f8d23e89d055eff9297c63db0e6f5a6"
  version "1.28.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.28.1/e9660fa/mw-v1.28.1-e9660fa-darwin-arm64.tar.xz"
      sha256 "e212a8c4c99e01dcbc4ced6eb9d7a3166befc674068726cf5f4d0858a0b27402"
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