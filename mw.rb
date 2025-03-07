class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.1/fac1fd4/mw-v1.4.1-fac1fd4-darwin-x64.tar.xz"
  sha256 "29b183d4c86f7f65c70d50341ae8d2bb84e5a8e7a02096ea5770dbc3cd157dc8"
  version "1.4.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.4.1/fac1fd4/mw-v1.4.1-fac1fd4-darwin-arm64.tar.xz"
      sha256 "29a0b12df35272e4320dd4d4906370703a7809da7af0fa5e8236094a2b9849ab"
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