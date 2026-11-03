class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.29.1/d8d6583/mw-v1.29.1-d8d6583-darwin-x64.tar.xz"
  sha256 "6b5bab4a6c904de67960404891e0b5f9b68088426262e83b64bba024eb75c300"
  version "1.29.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.29.1/d8d6583/mw-v1.29.1-d8d6583-darwin-arm64.tar.xz"
      sha256 "4b008243f344c30901a95bd2b3bcd45cef2acb8446b3b40ed2f554c0b43fa7dd"
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