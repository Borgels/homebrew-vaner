# SPDX-License-Identifier: Apache-2.0
#
# Vaner Desktop (macOS) — calm menu-bar-first companion for the Vaner
# predictive-context engine.
#
# Sources the .dmg from `Borgels/vaner-desktop-macos` GitHub releases.
# When the desktop consolidates onto the cross-platform Tauri build
# (`Borgels/vaner-desktop`) this cask should switch to that repo's
# release artifacts.

cask "vaner-desktop" do
  version "0.1.1"
  sha256 "a4b1f07c79837f200850ca55d73ab006f88c5af72c6f10ffd637bdec5ce54921"

  url "https://github.com/Borgels/vaner-desktop-macos/releases/download/v#{version}/vaner-#{version}.dmg",
      verified: "github.com/Borgels/vaner-desktop-macos/"
  name "Vaner Desktop"
  desc "Menu-bar companion for the Vaner predictive-context engine"
  homepage "https://vaner.ai"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Vaner.app"

  zap trash: [
    "~/Library/Application Support/Vaner",
    "~/Library/Caches/com.borgels.vaner",
    "~/Library/Preferences/com.borgels.vaner.plist",
  ]
end
