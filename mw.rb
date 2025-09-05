class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.10.0/49c606a/mw-v1.10.0-49c606a-darwin-x64.tar.xz"
  sha256 "88c4df76154e932350d16ebebdb93c5cf4b1cf7ca88e60f54d6356576e400656"
  version "1.10.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.10.0/49c606a/mw-v1.10.0-49c606a-darwin-arm64.tar.xz"
      sha256 "57e814750f72025a695d461f57f6c82cc605e4d3c73a4758e58ecbd035a8bac3"
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