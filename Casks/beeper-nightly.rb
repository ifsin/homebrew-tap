cask "beeper-nightly" do
  arch arm: "-arm64"
  livecheck_arch = on_arch_conditional arm: "arm64", intel: "x64"

  version "4.2.437"
  sha256 :no_check

  url "https://beeper-desktop.download.beeper.com/builds/Beeper%20Nightly-#{version}#{arch}-mac.zip"
  name "Beeper Nightly"
  desc "Universal chat app powered by Matrix"
  homepage "https://www.beeper.com/"

  livecheck do
    url "https://api.beeper.com/desktop/update-feed.json?bundleID=com.automattic.beeper.desktop.nightly&platform=macos&arch=#{livecheck_arch}&channel=stable"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Beeper Nightly.app"

  zap trash: [
    "~/Library/Application Support/BeeperTextsNightly",
    "~/Library/Caches/com.automattic.beeper.desktop.nightly",
    "~/Library/Caches/com.automattic.beeper.desktop.nightly.ShipIt",
    "~/Library/Preferences/com.automattic.beeper.desktop.nightly.plist",
    "~/Library/Saved Application State/com.automattic.beeper.desktop.nightly.savedState",
  ]
end
