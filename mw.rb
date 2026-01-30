class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.7/fe21dd4/mw-v1.13.1-beta.7-fe21dd4-darwin-x64.tar.xz"
  sha256 "518acebfd74a87266cf6f9ebd4e8d139a7e61a290bc31d9b67f2e476bca0b200"
  version "1.13.1-beta.7"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.7/fe21dd4/mw-v1.13.1-beta.7-fe21dd4-darwin-arm64.tar.xz"
      sha256 "a99e88171a2ce4e219500f6eed63c407eafff8ac57b4e4fbf7e2fb949f40de17"
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