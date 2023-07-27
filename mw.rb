class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.15/eb83bc7/mw-v1.0.0-alpha.15-eb83bc7-darwin-x64.tar.xz"
  sha256 "00f49f8e0565c23526c6bb465854129807e25257021d273ed0de84aa7351f8cf"
  version "1.0.0-alpha.15"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.15/eb83bc7/mw-v1.0.0-alpha.15-eb83bc7-darwin-arm64.tar.xz"
      sha256 "5630545319f37a301b7317a0fa9556323032a79a8a187c53306143a2400cb109"
    end
  end

  def install
    inreplace "bin/mw", /^CLIENT_HOME=/, "export HEROKU_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mw"
  end

  test do
    system bin/"mw", "--version"
  end
end