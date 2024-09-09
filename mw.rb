class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0/36fe12f/mw-v1.0.0-36fe12f-darwin-x64.tar.xz"
  sha256 "706d7b87b85371a158eaba457111cf8deb06701d36c580726a33412c8861cb36"
  version "1.0.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0/36fe12f/mw-v1.0.0-36fe12f-darwin-arm64.tar.xz"
      sha256 "ff9065edc6bec402c4f8a8e8739f8ff6a62919f4e7603a105eefb0495245e4a2"
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