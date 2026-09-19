cask "ice" do
  version "0.11.26"
  sha256 "f13241b48317633bf6c762c5c6e1b3de4cba0a265fbcc95e817a51095caa37a4"

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
