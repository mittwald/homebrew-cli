class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.2/9b7de74/mw-v1.20.2-9b7de74-darwin-x64.tar.xz"
  sha256 "dd2c2e14e34cad305aa60036e82b87ce10248f2b0d06c298ddbe865bd487564d"
  version "1.20.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.2/9b7de74/mw-v1.20.2-9b7de74-darwin-arm64.tar.xz"
      sha256 "75c6158d8b0b551de79cdfb4674e884cd9d7ff059b82e50edebf5c7ee0623876"
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