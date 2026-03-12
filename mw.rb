class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.4/1c006a1/mw-v1.13.4-1c006a1-darwin-x64.tar.xz"
  sha256 "db931e7e65fa70f75614e38f2ec768da5277d2248e373b0276cc72b2de418fd5"
  version "1.13.4"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.4/1c006a1/mw-v1.13.4-1c006a1-darwin-arm64.tar.xz"
      sha256 "852bd707ca85fa4b133597822604df1519372f488e3cdd1c68fdf6f7d867a25d"
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