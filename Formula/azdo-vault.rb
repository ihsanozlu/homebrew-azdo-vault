class AzdoVault < Formula
  desc "Cross-organization Azure DevOps backup and migration CLI"
  homepage "https://github.com/ihsanozlu/azdo-vault"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.1/azdo-vault-darwin-arm64"
      sha256 "eecc010faed2e80e4ab873fc35ca562a23c73100e83ad3b5854aab8e1ea84e2c"
    else
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.1/azdo-vault-darwin-amd64"
      sha256 "2b52f61d157b4fcbb5636504cf8bc53d3bf6b1e99fa4d9df56867ab30840e53f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.1/azdo-vault-linux-arm64"
      sha256 "fa9a0140a1849519307daa657b7c7cd96e168e7d9a24a15d214a61f97590675f"
    else
      url "https://github.com/ihsanozlu/azdo-vault/releases/download/v0.1.1/azdo-vault-linux-amd64"
      sha256 "d78be6442be9751b4f185dd01b270de28e57751dd3dba59c3a640b1b4e344aa6"
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
