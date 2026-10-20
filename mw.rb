class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.27.0/315fedd/mw-v1.27.0-315fedd-darwin-x64.tar.xz"
  sha256 "eb269a19c17b85b5c33f10c1ce96c2e388c8a49b94eefb980f842f52003d9fae"
  version "1.27.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.27.0/315fedd/mw-v1.27.0-315fedd-darwin-arm64.tar.xz"
      sha256 "0f8f57ba85a1224da05a75cfe4ccae028de6b8b6209318490ce7bfcbd4c54bac"
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