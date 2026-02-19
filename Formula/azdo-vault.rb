class AzdoVault < Formula
  desc "Cross-organization Azure DevOps backup and migration CLI"
  homepage "https://github.com/ihsanozlu/azdo-vault"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.2/azdo-vault-darwin-arm64"
      sha256 "e1474758bdf57a8635e337d3954e158ff2977e0484ca6a85b551a559ec213bf5"
    else
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.2/azdo-vault-darwin-amd64"
      sha256 "29d84d0c3459ae3fe38288b65f0f9757241dddf8bd24258c72d89fe2585b2225"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.2/azdo-vault-linux-arm64"
      sha256 "d1d9e0f544279b86846353b9f4ded24c5f4dbf37b1b51ada211057f10c97b56b"
    else
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.2/azdo-vault-linux-amd64"
      sha256 "6a6b5cd369b476652daa8528c98af357dc34fd960c7686a0f57ba10ee1814657"
    end
  end

  def install
    bin_name =
      if OS.mac?
        Hardware::CPU.arm? ? "azdo-vault-darwin-arm64" : "azdo-vault-darwin-amd64"
      else
        Hardware::CPU.arm? ? "azdo-vault-linux-arm64" : "azdo-vault-linux-amd64"
      end

    bin.install bin_name => "azdo-vault"
    generate_completions_from_executable(bin/"azdo-vault", "completion")
  end

  test do
    assert_match "azdo-vault", shell_output("#{bin}/azdo-vault version")
  end
end
