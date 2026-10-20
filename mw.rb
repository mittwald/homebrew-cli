class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/2.1.0/1f9ce16/mw-v2.1.0-1f9ce16-darwin-x64.tar.xz"
  sha256 "7d5dd27f6665270e0b205fceb90e957e6c2850e999df17a5baf398a7614b4b60"
  version "2.1.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/2.1.0/1f9ce16/mw-v2.1.0-1f9ce16-darwin-arm64.tar.xz"
      sha256 "fdb5aa50c513d1b478149d7f12dc7bd58c2d72ac93bf7de78c3162d7bf3749fb"
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