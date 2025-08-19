class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.7.0/07a871f/mw-v1.7.0-07a871f-darwin-x64.tar.xz"
  sha256 "af64ec7383b38126c749ae0f4e9262394fd8a74a34657616a9fd0576ed399b2d"
  version "1.7.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.7.0/07a871f/mw-v1.7.0-07a871f-darwin-arm64.tar.xz"
      sha256 "46006794b43419c6b06c2fc2cc2eb0f371e9b42e0830d7bf4a3ee3f23818cb58"
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