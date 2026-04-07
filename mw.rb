class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.14.0/3156caf/mw-v1.14.0-3156caf-darwin-x64.tar.xz"
  sha256 "5e49232b43e25e6b4381489aa0455fefd8d8f12142bc25775bab4b3267dcfde8"
  version "1.14.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.14.0/3156caf/mw-v1.14.0-3156caf-darwin-arm64.tar.xz"
      sha256 "9acd95418174747c7ba931f07156ccd3feaef7d44bd240ccc978cd5de548c131"
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