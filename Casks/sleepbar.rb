cask "sleepbar" do
  version "1.3.1"
  sha256 "ce6bc84dca7d653c4771bc761b8d5ca51743ca69d50f12e0b3cafe07285af01c"

  url "https://github.com/nateships/sleepbar/releases/download/v#{version}/SleepBar.dmg"
  name "SleepBar"
  desc "Sleep timer for the menu bar"
  homepage "https://sleepbar.app/"

  livecheck do
    url "https://sleepbar.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "SleepBar.app"

  uninstall quit: "app.sleepbar.SleepBar"

  zap trash: [
    "~/Library/Caches/app.sleepbar.SleepBar",
    "~/Library/HTTPStorages/app.sleepbar.SleepBar",
    "~/Library/Preferences/app.sleepbar.SleepBar.plist",
  ]
end
