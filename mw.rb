class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.35/0735565/mw-v1.0.0-alpha.35-0735565-darwin-x64.tar.xz"
  sha256 "235833f212ef7a2faacbed5b7805c19b33c54c89c0f9f00b39870046a216f819"
  version "1.0.0-alpha.35"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.35/0735565/mw-v1.0.0-alpha.35-0735565-darwin-arm64.tar.xz"
      sha256 "daf6c4ee9a75e01535692dad006397040fc51faee0e6d74d84b6c5a4c13b02de"
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