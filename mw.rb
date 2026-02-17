class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.3/b87df51/mw-v1.13.3-b87df51-darwin-x64.tar.xz"
  sha256 "331ff96e1e2b95be1afc912022b3f7b2bbd12ff5e54d6548abdde5f8105c3f0d"
  version "1.13.3"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.3/b87df51/mw-v1.13.3-b87df51-darwin-arm64.tar.xz"
      sha256 "7e259bf7da2b5aca92f44e5511d3f7379397c889c0d82ae9f078487f05890665"
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