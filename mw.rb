class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.6.0/9a140e2/mw-v1.6.0-9a140e2-darwin-x64.tar.xz"
  sha256 "0778c5e2c5d88f552ae9b6ed352077b619b4b18f41071e690e1d8d9a6b0ec22c"
  version "1.6.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.6.0/9a140e2/mw-v1.6.0-9a140e2-darwin-arm64.tar.xz"
      sha256 "5e13a2d8d62b98a4ac0b4e969bf2126b33f2e1bb9daf62300953ab6d7ad7dc39"
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