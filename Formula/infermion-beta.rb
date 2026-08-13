class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.0b4"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b4/infermion-v0.1.0b4-macos-arm64.zip"
      sha256 "9cdd81e8ae48e3c8f7170385aeb3f9969adc6ef20282dd9c8d1df93af2a834c5"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b4/infermion-v0.1.0b4-macos-x86_64.zip"
      sha256 "ee4b85fcafd246ffd39cd62f2285d80fa60cdf1f5a3e2e396b47b06d5ea30f9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b4/infermion-v0.1.0b4-linux-arm64.tar.gz"
      sha256 "a1b3f2ad4e4f0c8d4984b3ac96d12787b5f76fbea931cb61f10d1f191ea16476"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b4/infermion-v0.1.0b4-linux-x86_64.tar.gz"
      sha256 "4ba69d1f80daa8ed390058eca357047a51baa7a8f724518efcd579c2af33a65a"
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
