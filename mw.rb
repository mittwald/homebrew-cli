class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.1/f0c515e/mw-v1.20.1-f0c515e-darwin-x64.tar.xz"
  sha256 "26be8822a222e7f5b25c1a61ab5d53f4e0ade65f9b3dceb4cda36e83c850245b"
  version "1.20.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.1/f0c515e/mw-v1.20.1-f0c515e-darwin-arm64.tar.xz"
      sha256 "8eb321b36387c965e206b1807708a7dc6525d109d538bf55c699de623b49c79a"
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