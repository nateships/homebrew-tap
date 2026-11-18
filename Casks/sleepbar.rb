cask "sleepbar" do
  version "1.4.0"
  sha256 "34ef9e7fa73806a80e16551526a28d34fee52d0043e4dcf9b42e33b3bd4cd3c5"

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
