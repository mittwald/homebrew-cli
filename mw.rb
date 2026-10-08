class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/2.0.0/dfb7504/mw-v2.0.0-dfb7504-darwin-x64.tar.xz"
  sha256 "f5b8e29d4da52f60bde96fc8f768887ade7352f998e075a70c43234cafd93955"
  version "2.0.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/2.0.0/dfb7504/mw-v2.0.0-dfb7504-darwin-arm64.tar.xz"
      sha256 "b43c8501cb0d940e5c03105621f1765d8159c787416b9f07d32636ea68c2bfa4"
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