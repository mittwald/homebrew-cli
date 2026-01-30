class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.8/d0a1eeb/mw-v1.13.1-beta.8-d0a1eeb-darwin-x64.tar.xz"
  sha256 "e90745856bca8a947434cf7d876645f83a5ddd597459cc2842b413a7224e942b"
  version "1.13.1-beta.8"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.13.1-beta.8/d0a1eeb/mw-v1.13.1-beta.8-d0a1eeb-darwin-arm64.tar.xz"
      sha256 "1fa6c0f78f1097a6e5ca7f64b9b17bab4a61cda87031290d41596d8450e112b4"
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