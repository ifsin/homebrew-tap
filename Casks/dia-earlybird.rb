cask "dia-earlybird" do
  # version: app_version, build, uuid
  version "1.15.0,73651,D5B696F0-E63E-475D-92F6-28176299CA06"
  sha256 :no_check

  url "https://releases.diabrowser.com/release-candidate/" \
      "#{version.csv.third}/Dia-#{version.csv.first}-#{version.csv.second}.zip"
  name "Dia"
  desc "Web browser"
  homepage "https://www.diabrowser.com/"

  livecheck do
    url "https://releases.diabrowser.com/release-candidate/BoostBrowser-updates.xml"
    strategy :sparkle do |item|
      # Extract UUID from URL like:
      # https://releases.diabrowser.com/release-candidate/<UUID>/Dia-1.9.0-72038.zip
      uuid = item.url[%r{/([0-9A-F-]{36})/Dia-}i, 1]

      # Build CSV version: app_version,build,uuid
      "#{item.short_version},#{item.version},#{uuid}"
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Dia.app"

  zap trash: [
    "~/Library/Application Support/Dia",
    "~/Library/Caches/company.thebrowser.dia",
    "~/Library/HttpStorages/company.thebrowser.dia",
    "~/Library/HttpStorages/company.thebrowser.dia.binarycookies",
    "~/Library/Preferences/company.thebrowser.dia.plist",
  ]
end
