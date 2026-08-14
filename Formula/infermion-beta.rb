class InfermionBeta < Formula
  desc "CLI and terminal UI for the Infermion AI compute platform"
  homepage "https://infermion.com"
  version "0.1.0b8"
  license :cannot_represent
  # License terms: https://infermion.com/legal/client-terms
  conflicts_with "infermion", because: "both install the infermion executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b8/infermion-v0.1.0b8-macos-arm64.zip"
      sha256 "b55d59ea6c534836b710f699b2a26992d4c25e49b0986098f2b205aea4e10bf5"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b8/infermion-v0.1.0b8-macos-x86_64.zip"
      sha256 "eef17a8edeac79a4668dc019bec5a3903a640980b9339dd6134937882523caac"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b8/infermion-v0.1.0b8-linux-arm64.tar.gz"
      sha256 "b298f07d6055aaaa847461c7e821d3af130f7d1fafc2655bab98cc85f1512932"
    else
      url "https://github.com/infermion/infermion-cli-releases/releases/download/cli-v0.1.0b8/infermion-v0.1.0b8-linux-x86_64.tar.gz"
      sha256 "28ff660268f3719dba8a6175fb2833bd11af541542cf5b5d8f4f2e795af61e0b"
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
