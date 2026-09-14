cask "sleepbar" do
  version "1.2.0"
  sha256 "769407270fa18d877d1bd5020ee52e9cc33d905986c1d8e15bc695ed8c6189ab"

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
