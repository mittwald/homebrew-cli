class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.5/1278fdb/mw-v1.13.1-beta.5-1278fdb-darwin-x64.tar.xz"
  sha256 "e78f12749570d53e4d3d6bee44e39a41737ee91ede149755c1bfc9572dda8762"
  version "1.13.1-beta.5"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.5/1278fdb/mw-v1.13.1-beta.5-1278fdb-darwin-arm64.tar.xz"
      sha256 "b3b3cd135a49ff6363c8128aeaf2dba3519576f30cc4854a0247dbaac403a807"
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