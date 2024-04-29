class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.43/dd50898/mw-v1.0.0-alpha.43-dd50898-darwin-x64.tar.xz"
  sha256 "23bb44fd8b5798fe37472acf6644169e4d131453667948f570f859022081d361"
  version "1.0.0-alpha.43"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.43/dd50898/mw-v1.0.0-alpha.43-dd50898-darwin-arm64.tar.xz"
      sha256 "5e57e55d5fe8b086b38f1214ad889c3a636b34c5756d548761a06045849dd560"
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