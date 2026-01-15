class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.12.1/02464ab/mw-v1.12.1-02464ab-darwin-x64.tar.xz"
  sha256 "ccff74518795f3d39b9977e4f47ada24e5c399e19024fa731519aed7fe8265ca"
  version "1.12.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.12.1/02464ab/mw-v1.12.1-02464ab-darwin-arm64.tar.xz"
      sha256 "bfe673777ec1a6c11faaad0092d2c0adf4b229402e628c2b6dcc381493e2146b"
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