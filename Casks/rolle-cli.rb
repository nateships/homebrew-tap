cask "rolle-cli" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  sha256 arm:   "2cace78228b11da3484719c80faec31afe67a408b64902945c8104a865a40cd3",
         intel: "bad78cb36fd13800ba6f13089440023cb42135a9e60c207fe622bff29e56c63f"

  url "https://github.com/nateships/rolle/releases/download/v#{version}/rolle_#{version}_darwin_#{arch}.tar.gz"
  name "rolle-cli"
  desc "Assume any role, any cloud"
  homepage "https://getrolle.com/"

  binary "rolle"
  generate_completions_from_executable "rolle", "completion", shells: [:bash, :zsh, :fish]
end
