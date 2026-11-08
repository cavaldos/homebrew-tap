cask "ice" do
  version "0.11.36"
  sha256 "59f2bb47e36f8492b33ff881f67635b1afc46668813b9d6e166d85e3dc909ff3"

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
