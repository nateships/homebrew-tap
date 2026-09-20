cask "sleepbar" do
  version "1.3.0"
  sha256 "4904a102dcf9f2e8cf72b900f45e63a53f39c7fe210c96e12afbdfed61844d24"

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
