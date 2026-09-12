cask "rolle" do
  version "0.1.0"
  sha256 "87e19c6ad74fdc485239d589310c12d13402a3e72421d44a38b1488cbe4fb2f8"

  url "https://github.com/nateships/rolle/releases/download/v#{version}/Rolle.dmg"
  name "Rolle"
  desc "Assume any role, any cloud"
  homepage "https://getrolle.com/"

  auto_updates true
  depends_on macos: :monterey

  app "Rolle.app"

  # The app stores its files in the XDG directories, which on macOS
  # resolve under ~/Library. The dot paths cover XDG_* overrides.
  zap trash: [
    "~/.cache/rolle",
    "~/.config/rolle",
    "~/Library/Application Support/rolle",
    "~/Library/Caches/rolle",
  ]
end
