class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.44/05c93a2/mw-v1.0.0-alpha.44-05c93a2-darwin-x64.tar.xz"
  sha256 "921866b6c2b9416db4c56ec5827b2f90b5e6bc2ccecc1ca6364f048806d922b3"
  version "1.0.0-alpha.44"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.44/05c93a2/mw-v1.0.0-alpha.44-05c93a2-darwin-arm64.tar.xz"
      sha256 "c9f3c0596527f686aee00ce794879f787324a87170fc2ab85d0899017d29f037"
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