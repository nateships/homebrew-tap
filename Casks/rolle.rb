cask "rolle" do
  version "0.1.2"
  sha256 "34b303854f2c229477216ca76a292b58f8cd0cd5cdf906fd99a6bf2b5b1a185f"

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
