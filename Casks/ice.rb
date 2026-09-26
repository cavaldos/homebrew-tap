cask "ice" do
  version "0.11.29"
  sha256 "9614b50ef0b34e4c576a4b8f7517357d9b48dad5ac437c1a4257f43c84a76fa5"

  url "https://github.com/cavaldos/Ice/releases/download/v#{version}/Ice.zip"
  name "Ice"
  desc "Free and open-source menu bar manager for macOS"
  homepage "https://icemenubar.app"

  depends_on macos: :sonoma
  conflicts_with cask: "jordanbaird-ice"

  app "Ice.app"

  zap trash: [
    "~/Library/Preferences/com.jordanbaird.Ice.plist",
  ]

  caveats <<~EOS
    Ice is ad-hoc signed. On first launch, right-click the app and choose Open.
    After every update, re-grant Accessibility and Screen Recording in
    System Settings > Privacy & Security (see https://github.com/cavaldos/Ice#permissions).
  EOS
end
