class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.40/2449ec1/mw-v1.0.0-alpha.40-2449ec1-darwin-x64.tar.xz"
  sha256 "c6a3964cda59d5b4d0f47b2f9945b685d442bff8891ccf3463650623defc79d4"
  version "1.0.0-alpha.40"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.40/2449ec1/mw-v1.0.0-alpha.40-2449ec1-darwin-arm64.tar.xz"
      sha256 "420fcebdc130cb7d91d5cb13c866f734e85697fbefaef4aebf1b4cbbbfe7e589"
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