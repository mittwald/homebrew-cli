class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.11.0/360983c/mw-v1.11.0-360983c-darwin-x64.tar.xz"
  sha256 "8c0019720fb150fc9193734d7acf7ed032bbf7ed24904a9c034a6ad366e20750"
  version "1.11.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.11.0/360983c/mw-v1.11.0-360983c-darwin-arm64.tar.xz"
      sha256 "6acc01bccdec4fad2f7661477716aae718664ba5a2fbe56c855f5a32bff505b9"
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