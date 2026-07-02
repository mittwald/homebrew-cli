class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.0/ff516cd/mw-v1.20.0-ff516cd-darwin-x64.tar.xz"
  sha256 "0debfd2e658ef14bb8c58ea677d247abba5726798537ccb0903ab361f2e74a52"
  version "1.20.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.20.0/ff516cd/mw-v1.20.0-ff516cd-darwin-arm64.tar.xz"
      sha256 "d2235f255e53a2ef8f41c77226a0c2e868946244f08ab9d622dc8e948bbea735"
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