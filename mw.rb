class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.2/9afb6cb/mw-v1.13.2-9afb6cb-darwin-x64.tar.xz"
  sha256 "2af75136e7b8a52928465b89f97d4a5ea271d55c2ce3d07b50bd799f34fb4c72"
  version "1.13.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.2/9afb6cb/mw-v1.13.2-9afb6cb-darwin-arm64.tar.xz"
      sha256 "bdabef4328ec2d3d9d65d51646dbfc161228dfeb3e61e212501dd8719809adeb"
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