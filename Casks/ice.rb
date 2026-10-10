cask "ice" do
  version "0.11.30"
  sha256 "6ebeaa38bb1b32f97de4ffc5a07a74c5fa3c820ab7dc7322cc3a9b8d58977fe2"

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
