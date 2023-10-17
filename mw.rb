class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.25/fb97526/mw-v1.0.0-alpha.25-fb97526-darwin-x64.tar.xz"
  sha256 "324fbf01bd028c5b2284a26d92713c7b53ddc5a4d162412a5bbf13871d73ea5c"
  version "1.0.0-alpha.25"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.25/fb97526/mw-v1.0.0-alpha.25-fb97526-darwin-arm64.tar.xz"
      sha256 "0755bc8f99d570f68ea40f891f6fd19f4404202bccd2fc8f7f65982245972172"
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