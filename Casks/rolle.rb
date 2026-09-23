cask "rolle" do
  version "0.14.1"
  sha256 "1c8ea97feebcb463d40ce5bc86c46b5a436cfbc0477f913106945a45300da4df"

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
