class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.11.1/04bdf97/mw-v1.11.1-04bdf97-darwin-x64.tar.xz"
  sha256 "03ff83a3d1d8102e23e94ac072adf2d1699f79de59eb02eab68a9b2cc2df72f7"
  version "1.11.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.11.1/04bdf97/mw-v1.11.1-04bdf97-darwin-arm64.tar.xz"
      sha256 "59fcb2968a7bee067c32a5edc32e064910d6a1258791fc44465282f5fcb27071"
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