cask "thorion" do
  version "0.0.3"
  sha256 "4f9c646d1bd186e0f31659ebcd15daefd39d555d5024f80fbb30474b184561d8"

  url "https://github.com/cavaldos/Thorion/releases/download/v#{version}/Thorion.dmg"
  name "Thorion"
  desc "Menu bar battery monitor and charge limiter for Apple Silicon MacBooks"
  homepage "https://github.com/cavaldos/Thorion"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "thorion.app"

  # Releases are ad-hoc signed and not notarized; without this Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/thorion.app"],
        must_succeed: false
  end

  uninstall launchctl: "com.thorion.app.charging-helper",
            quit:      "com.thorion.app"

  zap trash: "~/Library/Preferences/com.thorion.app.plist"

  caveats <<~EOS
    Thorion is ad-hoc signed. If macOS still blocks it, run:
      xattr -dr com.apple.quarantine #{appdir}/thorion.app
  EOS
end
