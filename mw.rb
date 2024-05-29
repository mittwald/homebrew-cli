class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.47/2c1739a/mw-v1.0.0-alpha.47-2c1739a-darwin-x64.tar.xz"
  sha256 "1668299748ddb3463ded54409ba6ceffebaa9c161a44fda1c63e47ef71649fd7"
  version "1.0.0-alpha.47"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.47/2c1739a/mw-v1.0.0-alpha.47-2c1739a-darwin-arm64.tar.xz"
      sha256 "54c1ad375edc343fd91f5bb8e03af1464d666567bf5459dca3ca5fa3c47220cd"
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