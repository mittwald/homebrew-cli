class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.38/f647c04/mw-v1.0.0-alpha.38-f647c04-darwin-x64.tar.xz"
  sha256 "396a49ef3985027873dfcd450613f2c2d7eb1068bdd3ca41bd0caf51cbbdaba2"
  version "1.0.0-alpha.38"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.38/f647c04/mw-v1.0.0-alpha.38-f647c04-darwin-arm64.tar.xz"
      sha256 "3fcb234da5cd6f878faf3736db3ed3ca86f94cebc104fede23d58bb4de3d54a8"
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