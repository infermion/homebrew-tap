class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.0b6"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b6/infermion-v0.1.0b6-macos-arm64.zip"
      sha256 "4f5a4288d14c4e7737231757f97110aac6794272a95ad4b19bd30544fab813fe"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b6/infermion-v0.1.0b6-macos-x86_64.zip"
      sha256 "ffc2af5a8c5bdc7aaf4a087de76be09f1ef62bfbbcae70d8036125887a0babef"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b6/infermion-v0.1.0b6-linux-arm64.tar.gz"
      sha256 "4cc4061ae0f6dc2b033db5869dd89ecc932cc9f01c0dafd2f5e6aa95db90951a"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b6/infermion-v0.1.0b6-linux-x86_64.tar.gz"
      sha256 "c95bcf871802825ffa54191bb173df71373013d15b3b5cbd2f6eb85dad7fd2c6"
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
