class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.30/0812ee9/mw-v1.0.0-alpha.30-0812ee9-darwin-x64.tar.xz"
  sha256 "c805f6a6d93f292fd8d8be9551d68703e29374700077c85767de630eafef714b"
  version "1.0.0-alpha.30"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.30/0812ee9/mw-v1.0.0-alpha.30-0812ee9-darwin-arm64.tar.xz"
      sha256 "66844304e53424f096b3604cfebbcf02e464235185a3d84628ffc3fd50475192"
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