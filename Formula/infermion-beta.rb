class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.0b7"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b7/infermion-v0.1.0b7-macos-arm64.zip"
      sha256 "301f9274788351d31939f29d2be689f5d554f4575f31262a3ea03edcbce537fa"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b7/infermion-v0.1.0b7-macos-x86_64.zip"
      sha256 "d49f8ce63703ce26230af72dd8b0f85bfe0da7f0612db8d214fdc619ae224a81"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b7/infermion-v0.1.0b7-linux-arm64.tar.gz"
      sha256 "9e6ef691280ce225720e2d1ef454cdbe838017cf17f4a1ad21d8695bba1d537f"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b7/infermion-v0.1.0b7-linux-x86_64.tar.gz"
      sha256 "bc0a22244e43075e664e6f6a932addcbd34cf9dcea251de79c818bc63b892220"
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
