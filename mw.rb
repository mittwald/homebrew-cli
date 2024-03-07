class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.39/f3ca562/mw-v1.0.0-alpha.39-f3ca562-darwin-x64.tar.xz"
  sha256 "2d5ade79306eb3f59aff699965cdaf5051573dbfc5314287eacaf4b3cb25781e"
  version "1.0.0-alpha.39"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.39/f3ca562/mw-v1.0.0-alpha.39-f3ca562-darwin-arm64.tar.xz"
      sha256 "5dc9ced283d86ce27f04ec6bc25ac38c3eb6d953dc8bce932dca82f788fb0481"
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