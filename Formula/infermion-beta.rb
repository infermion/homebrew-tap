class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.1b2"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.1b2/infermion-v0.1.1b2-macos-arm64.zip"
      sha256 "d80a9714ba089573032d660f92d7154fbd72d2db760f36e15452070b3f16411d"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.1b2/infermion-v0.1.1b2-macos-x86_64.zip"
      sha256 "cde4ffd63e8bb38c5220a7d099e813d4d840981a8fe317af18f171b77666c3d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.1b2/infermion-v0.1.1b2-linux-arm64.tar.gz"
      sha256 "6f19a5adc2249a4d5e02f200f2d6a8b50db3bf4c9d4d30cf1f49685e9dad63bd"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.1b2/infermion-v0.1.1b2-linux-x86_64.tar.gz"
      sha256 "a3ff87971d8514dae4a4291bcc775ad034db68b82802b14d976c4f489f8024dc"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"infermion"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infermion --version")
    assert_match "Operate Infermion", shell_output("#{bin}/infermion --help")
  end
end
