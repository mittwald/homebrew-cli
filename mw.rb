class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.16.2/30912ac/mw-v1.16.2-30912ac-darwin-x64.tar.xz"
  sha256 "2bd56313d6d753b92ccdd53af6df0aad12f1ac20aec9098f89c1ead49dce3acf"
  version "1.16.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.16.2/30912ac/mw-v1.16.2-30912ac-darwin-arm64.tar.xz"
      sha256 "1b2c1e5152ef721c4490260b76b9a67b3607291bd79cd12f9fb77ce8e91fcca6"
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