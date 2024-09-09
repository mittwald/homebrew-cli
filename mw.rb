class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.2/d3b403f/mw-v1.0.0-beta.2-d3b403f-darwin-x64.tar.xz"
  sha256 "e62f66984a33ba68954a61df1f74ef46f366a253ee0183067271036db634989c"
  version "1.0.0-beta.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-beta.2/d3b403f/mw-v1.0.0-beta.2-d3b403f-darwin-arm64.tar.xz"
      sha256 "1a4926ecb730d53bc4baee7627a4b9ccf4194d67ac6e6c4addca63b28a950372"
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