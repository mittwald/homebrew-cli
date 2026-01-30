class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.4/4a35945/mw-v1.13.1-beta.4-4a35945-darwin-x64.tar.xz"
  sha256 "2f92ef6c17ab7636917bba6e4d6e949b57daf386a984774fc7690ebb717df0a6"
  version "1.13.1-beta.4"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.4/4a35945/mw-v1.13.1-beta.4-4a35945-darwin-arm64.tar.xz"
      sha256 "2ad22db7d39c48ac477e3b46315b7fc98f48c40fb54faeaf378c55eb53107173"
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