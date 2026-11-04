class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.29.2/7737e93/mw-v1.29.2-7737e93-darwin-x64.tar.xz"
  sha256 "2a91ed6f218002e8e948386adb99b778e1d14df3e5aa24a2076758f635c9f5aa"
  version "1.29.2"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.29.2/7737e93/mw-v1.29.2-7737e93-darwin-arm64.tar.xz"
      sha256 "914cee6c8714522b242950ee58673af23447dd2b9f9a4349f419b95b906ce2f7"
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