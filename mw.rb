class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.28/f9e896f/mw-v1.0.0-alpha.28-f9e896f-darwin-x64.tar.xz"
  sha256 "7e0a44cee9c75b5f558b803304f5d5dfb63d0e789eb058a36ea6f2177285b430"
  version "1.0.0-alpha.28"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.28/f9e896f/mw-v1.0.0-alpha.28-f9e896f-darwin-arm64.tar.xz"
      sha256 "344f7cea626aba32226ccd7d772e1e3f5b2e3b2bc5e22ea31d78fae1c4ee4d02"
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