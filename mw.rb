class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.3.0/d58f4e0/mw-v1.3.0-d58f4e0-darwin-x64.tar.xz"
  sha256 "b0bfe98bb1aa74d6d2e7bd8d46621248cb15e68f8396b76bd4e095d03bf37ec3"
  version "1.3.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.3.0/d58f4e0/mw-v1.3.0-d58f4e0-darwin-arm64.tar.xz"
      sha256 "be99f34e0e787d953d0b57caab61380f501723115ba56bc83a04eb551a624861"
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