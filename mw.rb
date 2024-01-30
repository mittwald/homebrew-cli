class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.31/c1b465d/mw-v1.0.0-alpha.31-c1b465d-darwin-x64.tar.xz"
  sha256 "26b17125e2fbd1fc4b88e3c5705f8e02a45f7075a2e40a1a276a7eed72860141"
  version "1.0.0-alpha.31"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.31/c1b465d/mw-v1.0.0-alpha.31-c1b465d-darwin-arm64.tar.xz"
      sha256 "e034c3326c241f8f709d00a4c1ec6479679dadbce7e27555cdf7e173b53e328c"
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