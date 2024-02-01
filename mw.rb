class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.33/17c6040/mw-v1.0.0-alpha.33-17c6040-darwin-x64.tar.xz"
  sha256 "86475110dd7bc7efd7153ff0cae45ffd288b2201276d2271b13d8c0cce4ca04b"
  version "1.0.0-alpha.33"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.33/17c6040/mw-v1.0.0-alpha.33-17c6040-darwin-arm64.tar.xz"
      sha256 "871f0ca715633239380310edc62ab08710d57f5a4cb0f97edda131da6bcb8252"
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