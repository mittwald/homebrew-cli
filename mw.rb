class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.22.0/5542b7c/mw-v1.22.0-5542b7c-darwin-x64.tar.xz"
  sha256 "0a1c8ee08774c16523bd591cb260ea645a7a0a2fb01099ee95d0e5bb92d04826"
  version "1.22.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.22.0/5542b7c/mw-v1.22.0-5542b7c-darwin-arm64.tar.xz"
      sha256 "36a2cf9ed747eab1d4367aec2d2134524edb97643536aa028a74c28be70081d7"
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