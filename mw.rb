class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.9.1/590f63a/mw-v1.9.1-590f63a-darwin-x64.tar.xz"
  sha256 "99a56175e5ea60128a7b8bba1c7cf7be3e72acf0616d4693e067357898fd30d6"
  version "1.9.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.9.1/590f63a/mw-v1.9.1-590f63a-darwin-arm64.tar.xz"
      sha256 "2617c01784566349717cb2bff5457ccdc45db6019e72fc1758bf20981c05d52e"
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