class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.41/2c79e9d/mw-v1.0.0-alpha.41-2c79e9d-darwin-x64.tar.xz"
  sha256 "8c7c25f1896441ad46cf12173301e0e3efb3ed88767a8b6792e5ae8dac050569"
  version "1.0.0-alpha.41"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.41/2c79e9d/mw-v1.0.0-alpha.41-2c79e9d-darwin-arm64.tar.xz"
      sha256 "14f725ceb1722cefbfc82c3b4bdf3ae6197d0474f0f46dba4ab57115d2c93272"
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