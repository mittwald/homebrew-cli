class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.21.1/10ffd29/mw-v1.21.1-10ffd29-darwin-x64.tar.xz"
  sha256 "18ebf3065ec1d48f9148857359b5d3a176c6f5dac433ec847af0e6582fa74ea8"
  version "1.21.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.21.1/10ffd29/mw-v1.21.1-10ffd29-darwin-arm64.tar.xz"
      sha256 "c9a8a43f1e9ab0da825ac43ec9a3fa47c248bb19f17292c3d8d909e239966ada"
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