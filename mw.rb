class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.19/799e536/mw-v1.0.0-alpha.19-799e536-darwin-x64.tar.xz"
  sha256 "f5273433ab4c07b28f7a897cfb42e2da1c08f7e7589c6f21cdf4c441bd8553ee"
  version "1.0.0-alpha.19"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.19/799e536/mw-v1.0.0-alpha.19-799e536-darwin-arm64.tar.xz"
      sha256 "7d20bb07ff3f3b43525522548c7fa276d3c7c66ae26ca39ba4d37a58373cf301"
    end
  end

  def install
    inreplace "bin/mw", /^CLIENT_HOME=/, "export HEROKU_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mw"
  end

  test do
    system bin/"mw", "--version"
  end
end