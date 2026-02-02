class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1/ac322fd/mw-v1.13.1-ac322fd-darwin-x64.tar.xz"
  sha256 "fd6e26e433a5f78b9fbd649930f1ea23e8c043ee370e626dbfba8ce4dac40a4e"
  version "1.13.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1/ac322fd/mw-v1.13.1-ac322fd-darwin-arm64.tar.xz"
      sha256 "c019161b47f36f62fefd8ce5da27ac5433fd2fe7ce6f25c10f6dc8abf4e7252b"
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