class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.11.2/36f78a9/mw-v1.11.2-36f78a9-darwin-x64.tar.xz"
  sha256 "92060f921e05b7898a2173e4d26791bf56e87fb188607dc9236cc190155bb09b"
  version "1.11.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.11.2/36f78a9/mw-v1.11.2-36f78a9-darwin-arm64.tar.xz"
      sha256 "40df17fea85c9fbe43ca063c1cf6577940e8371fb200624a3552a3334f2c8386"
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