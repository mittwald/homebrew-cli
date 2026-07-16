class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.3/d49f8ab/mw-v1.20.3-d49f8ab-darwin-x64.tar.xz"
  sha256 "1d34ff6728ca32ada3d50916876878cc173390e31c69eabe189c9e4276b6479e"
  version "1.20.3"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.3/d49f8ab/mw-v1.20.3-d49f8ab-darwin-arm64.tar.xz"
      sha256 "b7bf59c4eea4ccd6a3d3bf33813efbcc1a2169ec59fb0795feb59ada4bd8165d"
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