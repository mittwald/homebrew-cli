class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.6/b82475c/mw-v1.2.6-b82475c-darwin-x64.tar.xz"
  sha256 "3fe5e4989465be7c542d6d9e6ef51e348a954977d61685d990d16d9a6d3b3ac7"
  version "1.2.6"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.6/b82475c/mw-v1.2.6-b82475c-darwin-arm64.tar.xz"
      sha256 "66109c9fd57cba72895b4033460e3337465456a8b2c81168494bec09f72dee13"
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