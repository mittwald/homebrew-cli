class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.42/d8076f7/mw-v1.0.0-alpha.42-d8076f7-darwin-x64.tar.xz"
  sha256 "6107156673c7633acf2c4288601ef2daa8c8f2e60cf9888081c68b5e7b043c9b"
  version "1.0.0-alpha.42"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.42/d8076f7/mw-v1.0.0-alpha.42-d8076f7-darwin-arm64.tar.xz"
      sha256 "6e08ae3cf83515f3aedf97da32e97c151581398a9ac1273469f925ec69905c28"
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