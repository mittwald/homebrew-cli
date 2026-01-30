class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.1/521a0f6/mw-v1.13.1-beta.1-521a0f6-darwin-x64.tar.xz"
  sha256 "42914fb635140c6ea56d38dc6e6aa9bd3856c5049c2760160abc971e0498a1c7"
  version "1.13.1-beta.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.1/521a0f6/mw-v1.13.1-beta.1-521a0f6-darwin-arm64.tar.xz"
      sha256 "ec306e49f3e4dddf3d280d46e71b110feec6f3b5cfed8e491610ac4a663a3fd6"
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