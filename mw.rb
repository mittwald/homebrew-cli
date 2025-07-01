class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.5.0/d2e8ef0/mw-v1.5.0-d2e8ef0-darwin-x64.tar.xz"
  sha256 "779273a74f273a3f6ae7b235ea2c90696f88257d8c8c326efa9d0c81de288ce5"
  version "1.5.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.5.0/d2e8ef0/mw-v1.5.0-d2e8ef0-darwin-arm64.tar.xz"
      sha256 "bcade5cdd3d57693406b137b068725436013a9b4bb765644b310c431533d75cc"
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