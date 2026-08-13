class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.0b3"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b3/infermion-v0.1.0b3-macos-arm64.zip"
      sha256 "4bd570609fbc2dd1e3054d28ef743352583ddf08d21931ff603a46739f54b387"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b3/infermion-v0.1.0b3-macos-x86_64.zip"
      sha256 "7ec68448a41976c657b67c3ab2c4d2b1900f603a9c1b2f8c555fadf3cd151b4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b3/infermion-v0.1.0b3-linux-arm64.tar.gz"
      sha256 "90a57824a79cbdee1497d23f8fe82c6dccf7805153f9cc59a6c39c651ed06991"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b3/infermion-v0.1.0b3-linux-x86_64.tar.gz"
      sha256 "036e8114df7010df1afecdc47e709722a425df532f20bcd88541f5e03927fbff"
    end
  end

  def install
    bin.install "infermion"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infermion --version")
    assert_match "Operate Infermion", shell_output("#{bin}/infermion --help")
  end
end
