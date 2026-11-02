class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.29.0/5eeab9a/mw-v1.29.0-5eeab9a-darwin-x64.tar.xz"
  sha256 "6186b9c5ed5ef4536c7fc35291fefb7441d93840cbb36cde43b9fd0dc4b946af"
  version "1.29.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.29.0/5eeab9a/mw-v1.29.0-5eeab9a-darwin-arm64.tar.xz"
      sha256 "f9eecdf908c23e15fd8e0a2d02e0fa01cf8a64f36848bf4ee5eb335f1e2fd257"
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