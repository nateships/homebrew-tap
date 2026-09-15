cask "rolle" do
  version "0.5.0"
  sha256 "6cb18547e92e606d6099a8ea10b8ad6b790d9e0c8841e3e550f5146fb2c16f7a"

  url "https://github.com/nateships/rolle/releases/download/v#{version}/rolle.dmg"
  name "rolle"
  desc "Assume any role, any cloud"
  homepage "https://getrolle.com/"

  auto_updates true
  depends_on macos: :monterey

  app "rolle.app"
  binary "#{appdir}/rolle.app/Contents/Helpers/rolle"
  generate_completions_from_executable "#{appdir}/rolle.app/Contents/Helpers/rolle", "completion",
                                       shells: [:bash, :zsh, :fish]

  # The app stores its files in the XDG directories, which on macOS
  # resolve under ~/Library. The dot paths cover XDG_* overrides.
  zap trash: [
    "~/.cache/rolle",
    "~/.config/rolle",
    "~/Library/Application Support/rolle",
    "~/Library/Caches/rolle",
  ]
end
