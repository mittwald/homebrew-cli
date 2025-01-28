class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.3/b4f57bc/mw-v1.2.3-b4f57bc-darwin-x64.tar.xz"
  sha256 "651a0f75ea402607018f90ccf8fdd1cf1e99dd183a038ca28e739e4361d08c90"
  version "1.2.3"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.3/b4f57bc/mw-v1.2.3-b4f57bc-darwin-arm64.tar.xz"
      sha256 "09402fafcfd25521b49c12d24cd7eabbd1ea686395ef0cf7187e7ffafbfb3133"
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