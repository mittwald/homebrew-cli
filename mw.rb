class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.21/e8277ab/mw-v1.0.0-alpha.21-e8277ab-darwin-x64.tar.xz"
  sha256 "4c5d0d61f5ea2a99447a5c81722e0c6f28589a7bd6a9df83c3def034d99bec4d"
  version "1.0.0-alpha.21"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.21/e8277ab/mw-v1.0.0-alpha.21-e8277ab-darwin-arm64.tar.xz"
      sha256 "d64d74e1f9f0021b0ab596a4771f39272e82a781da0103794a6858644c5767ea"
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