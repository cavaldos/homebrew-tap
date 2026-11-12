cask "ice" do
  version "0.11.37"
  sha256 "5cfd61f8f6f22132d1a6e2fc2b4f79e3c6ef121001c3e94fd9462316f0aa22c3"

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
    Ice is self-signed and not notarized. On first launch, right-click the app and choose Open.
    Grant Accessibility and Screen Recording once in System Settings > Privacy & Security;
    updates keep them (see https://github.com/cavaldos/Ice#permissions).
  EOS
end
