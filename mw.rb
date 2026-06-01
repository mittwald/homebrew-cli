class Mw < Formula
  desc "The mittwald command-line tool"
  homepage "https://github.com/mittwald/cli"
  url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.17.1/4690ced/mw-v1.17.1-4690ced-darwin-x64.tar.xz"
  sha256 "6888cac3600904b38af64fc6bfedc334240dcb6f1f56e6c429e77bfdbf698c80"
  version "1.17.1"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://mittwald-cli.s3.eu-central-1.amazonaws.com/versions/1.17.1/4690ced/mw-v1.17.1-4690ced-darwin-arm64.tar.xz"
      sha256 "d9b64a101a6246d8763fa78e1978b8396499afd7cba3bb6436c68b7fa47cb2bb"
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