class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.26/d4361e2/mw-v1.0.0-alpha.26-d4361e2-darwin-x64.tar.xz"
  sha256 "550ac69354932376f220aef663c9d09faf5e6701ac93b8d7a9af9b4189530fff"
  version "1.0.0-alpha.26"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.26/d4361e2/mw-v1.0.0-alpha.26-d4361e2-darwin-arm64.tar.xz"
      sha256 "b4fc3a092959190e924bde88486df820d13b7f472246309e2cc344b0c36b6ffe"
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