class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.19.0/39a442d/mw-v1.19.0-39a442d-darwin-x64.tar.xz"
  sha256 "e27221c9a8bd987c06c59ec42cdc688a33c70d5b4fe1c9a230097ac22b8b85c3"
  version "1.19.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.19.0/39a442d/mw-v1.19.0-39a442d-darwin-arm64.tar.xz"
      sha256 "79f91556de91f320ef7e067a70443a3a9eb78ee2fe0c8bb259d502e5385e3058"
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