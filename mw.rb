class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.34/eeef309/mw-v1.0.0-alpha.34-eeef309-darwin-x64.tar.xz"
  sha256 "ecfe00f5e87f8125379af43f7cc4bf390ad7d11eda7a2341a866ba14732b5405"
  version "1.0.0-alpha.34"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.34/eeef309/mw-v1.0.0-alpha.34-eeef309-darwin-arm64.tar.xz"
      sha256 "d2b1e904d9aa396d17125e9203c13299b837169a064d37dffd3876ca8e5b24c9"
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