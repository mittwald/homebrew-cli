class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.5.1/242404c/mw-v1.5.1-242404c-darwin-x64.tar.xz"
  sha256 "1485a5ddc60de2a8017021bb37c660d737f8573cec7957e5581d9220fb089175"
  version "1.5.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.5.1/242404c/mw-v1.5.1-242404c-darwin-arm64.tar.xz"
      sha256 "adf2172b90b8cd49470eca5edc7c28f00d510b3b339594e46d48aaa585a1aa59"
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