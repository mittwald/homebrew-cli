class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.1.0/70458e7/mw-v1.1.0-70458e7-darwin-x64.tar.xz"
  sha256 "d4cbfcc0b8799e07826da8b709fc90065148e436a69e6bddbc689013ceacbca2"
  version "1.1.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.1.0/70458e7/mw-v1.1.0-70458e7-darwin-arm64.tar.xz"
      sha256 "0b229690e9fed5f7801ae9eda310f0fc331bd7595016adc3758c4f7d4e782bb9"
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