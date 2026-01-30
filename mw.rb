class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.6/ff18e7a/mw-v1.13.1-beta.6-ff18e7a-darwin-x64.tar.xz"
  sha256 "b6aeeb09dacd3416afe9729beb71be6416bf49fea383a5dd27dc4a0e1cb012f4"
  version "1.13.1-beta.6"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.6/ff18e7a/mw-v1.13.1-beta.6-ff18e7a-darwin-arm64.tar.xz"
      sha256 "788db9da55926516cb51ae10b7e80e4079bf97462e5a3e4779b8bbb1e5acb09e"
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