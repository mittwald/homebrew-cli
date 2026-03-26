class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.5/7baa60f/mw-v1.13.5-7baa60f-darwin-x64.tar.xz"
  sha256 "6af71dc9ed9a246716ed39bd1daac137a1db5ae4046cb1456058f780d83b14c4"
  version "1.13.5"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.5/7baa60f/mw-v1.13.5-7baa60f-darwin-arm64.tar.xz"
      sha256 "85ec3c7f25b4750c225891cf849cf7d920358c4e49c52c7c8bad03549cd854a0"
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