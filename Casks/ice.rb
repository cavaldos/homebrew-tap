cask "ice" do
  version "0.11.27"
  sha256 "ffd5c864143266602163b8f52f89f5442fb519d790044913d64c90bdbeb14d7c"

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
