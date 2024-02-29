class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.37/0a65a3a/mw-v1.0.0-alpha.37-0a65a3a-darwin-x64.tar.xz"
  sha256 "251e12b23887f0d4764fe5319ac9161a543cdeb32c4bf8e38d4b1f0481d02572"
  version "1.0.0-alpha.37"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.37/0a65a3a/mw-v1.0.0-alpha.37-0a65a3a-darwin-arm64.tar.xz"
      sha256 "a3e43166a574ef106aa204fc9d3c6b52cc9c8591b4c6104c89776522c1da9f6a"
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