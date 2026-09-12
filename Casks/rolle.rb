cask "rolle" do
  version "0.1.1"
  sha256 "d1e7ee5484be3e733175c5261434abaeeb28b20b49f88c533a9fe0ab678ff5dd"

  url "https://github.com/nateships/rolle/releases/download/v#{version}/Rolle.dmg"
  name "Rolle"
  desc "Assume any role, any cloud"
  homepage "https://getrolle.com/"

  auto_updates true
  depends_on macos: :monterey

  app "Rolle.app"
  binary "#{appdir}/Rolle.app/Contents/Helpers/rolle"
  generate_completions_from_executable "#{appdir}/Rolle.app/Contents/Helpers/rolle", "completion",
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
