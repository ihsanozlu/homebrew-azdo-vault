class AzdoVault < Formula
  desc "Cross-organization Azure DevOps backup and migration CLI"
  homepage "https://github.com/ihsanozlu/azdo-vault"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.3/azdo-vault-darwin-arm64"
      sha256 "c8d81e9987a62fe1e897363a1e35886d53377576e0fd94566992e0bfae89d431"
    else
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.2/azdo-vault-darwin-amd64"
      sha256 "89a0faecd6a5ab15cd2e4f1f3c32dd82d34b9bff77952c5d9f033ba55a5ea93f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.3/azdo-vault-linux-arm64"
      sha256 "09c3feeb194d9bb343c3bebc3dcde641ae44d5790f94f078cd59125b22e943f3"
    else
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.3/azdo-vault-linux-amd64"
      sha256 "f710769cc5cc6f18c90125ad0be790d21d8b8dbd5576e5456312e3c30d6bdbc5"
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
    chmod 0755, bin/"azdo-vault"
    generate_completions_from_executable(bin/"azdo-vault", "completion")
  end

  test do
    assert_match "azdo-vault", shell_output("#{bin}/azdo-vault version")
  end
end
