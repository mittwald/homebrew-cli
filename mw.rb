class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.27/d30294f/mw-v1.0.0-alpha.27-d30294f-darwin-x64.tar.xz"
  sha256 "e9d7f11861ba84bb77c38692fbd219f582ff172af8b69a5bbafad8f6fdd41c3e"
  version "1.0.0-alpha.27"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.0.0-alpha.27/d30294f/mw-v1.0.0-alpha.27-d30294f-darwin-arm64.tar.xz"
      sha256 "42d1718d45dacda89ced75aff184edd9335c352c9df9b32f9928c7508d0b31b9"
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