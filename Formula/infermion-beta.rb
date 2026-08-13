class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.0b5"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b5/infermion-v0.1.0b5-macos-arm64.zip"
      sha256 "1bd056a661c06b748cf1640823955edeaf7790862bd017a7f36a3ff5494ee5c3"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b5/infermion-v0.1.0b5-macos-x86_64.zip"
      sha256 "aa2bfe5c19346637ccb44e2f662663e865f3e85a7c34fa827de87a6ef223b2dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b5/infermion-v0.1.0b5-linux-arm64.tar.gz"
      sha256 "9b1c978bea2d51215765e5c0484b4543c094f90ba6294b0d6f1cc6a57db2be90"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b5/infermion-v0.1.0b5-linux-x86_64.tar.gz"
      sha256 "8fdaef6be44d6b84bf27a38bfd0c3ecf80f53b415d3c09712fb8c9df09382de2"
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
