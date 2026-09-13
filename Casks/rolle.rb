cask "rolle" do
  version "0.3.0"
  sha256 "7f8279d9d5476ca5c2108ea3f12066fc451532c619118ac9e7f1de0755b68086"

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
