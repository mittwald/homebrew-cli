class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.46/390e339/mw-v1.0.0-alpha.46-390e339-darwin-x64.tar.xz"
  sha256 "ec419bf727a7e60dbcb369f614fbbcd2eb16794506b56548d0e78883ccb3c678"
  version "1.0.0-alpha.46"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.46/390e339/mw-v1.0.0-alpha.46-390e339-darwin-arm64.tar.xz"
      sha256 "bf1940332eb5ae1a80d90b8dc1a2feb073dc51bbb0a85303d978c8fa2094deec"
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