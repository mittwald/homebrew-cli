class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.0/e61d4c6/mw-v1.4.0-e61d4c6-darwin-x64.tar.xz"
  sha256 "441b931944c45f06230667dbbbc6cef59c4d5f2acd0048e32e67416aa95a730c"
  version "1.4.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.0/e61d4c6/mw-v1.4.0-e61d4c6-darwin-arm64.tar.xz"
      sha256 "cf519b0ee5fb5697a61d74a8738302e771b3c0f0eca04771d9b2ccbe42406914"
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