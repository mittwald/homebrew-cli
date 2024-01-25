class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.29/c351ef1/mw-v1.0.0-alpha.29-c351ef1-darwin-x64.tar.xz"
  sha256 "c4b9a7a52ca499341488986ae273061e15aca8063681e93bae869efcfa070395"
  version "1.0.0-alpha.29"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.29/c351ef1/mw-v1.0.0-alpha.29-c351ef1-darwin-arm64.tar.xz"
      sha256 "2e7bc8d97c10d9d8ece29df4fecbed3842c168b6a6ef96432609ab2fdcb4d0a9"
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