class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.36/9f1b1f8/mw-v1.0.0-alpha.36-9f1b1f8-darwin-x64.tar.xz"
  sha256 "6370868142f9b5e70839259e6bdce46f9bf26f13ba81c85b71555f04de9a5bbb"
  version "1.0.0-alpha.36"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.36/9f1b1f8/mw-v1.0.0-alpha.36-9f1b1f8-darwin-arm64.tar.xz"
      sha256 "968b17246bb9460a9b231dce6a00292f40c0521da5690cb159ecbd64a571c99c"
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