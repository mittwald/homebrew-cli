class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.3/e8f7bac/mw-v1.0.0-beta.3-e8f7bac-darwin-x64.tar.xz"
  sha256 "b94435ded762511abc59e7d354325fd9abb9c464ecc698177a6a30830f65af99"
  version "1.0.0-beta.3"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.3/e8f7bac/mw-v1.0.0-beta.3-e8f7bac-darwin-arm64.tar.xz"
      sha256 "e23d85206ef425305215e6e5eec70be2f93b71e5b19ed3117d13a15fc874e84d"
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