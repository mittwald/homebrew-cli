class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.4/d9c4e0f/mw-v1.2.4-d9c4e0f-darwin-x64.tar.xz"
  sha256 "29b4087e541231462339304e844b276df3052388d9cf23336c17b51f44f4e88f"
  version "1.2.4"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.2.4/d9c4e0f/mw-v1.2.4-d9c4e0f-darwin-arm64.tar.xz"
      sha256 "2e99f1cd6a475b817270d294fbfd8629a7ff68058a176b4a1ab44d6344636537"
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