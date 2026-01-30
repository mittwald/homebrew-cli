class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.2/c9228dc/mw-v1.13.1-beta.2-c9228dc-darwin-x64.tar.xz"
  sha256 "ce328e259b20f30f0d30ea8b545e847ef4c8fc6df3a3ea84f96ecec48b263dd4"
  version "1.13.1-beta.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.2/c9228dc/mw-v1.13.1-beta.2-c9228dc-darwin-arm64.tar.xz"
      sha256 "3e44b2cca5157774fa7cc45045ea3e244350589a763ec4dde2338d2e85ed9639"
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