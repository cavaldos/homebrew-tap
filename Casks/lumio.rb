cask "lumio" do
  version "0.0.4"
  sha256 "ce0ee0c670fa570a56c1a37606417b2a88ac6ebd69b127347e5ce80308aaf0cf"

  url "https://github.com/cavaldos/Lumio/releases/download/v#{version}/Lumio.dmg"
  name "Lumio"
  desc "Local-first keyboard launcher and Spotlight alternative"
  homepage "https://github.com/cavaldos/Lumio"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Lumio.app"
  binary "#{appdir}/Lumio.app/Contents/MacOS/Lumio", target: "lumio"

  # Releases are ad-hoc signed and not notarized; without this Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Lumio.app"],
        must_succeed: false
  end

  uninstall quit: "com.cavaldos.Lumio"

  zap trash: [
    "~/.lumio",
    "~/Library/Application Support/lumio",
    "~/Library/Preferences/com.cavaldos.Lumio.plist",
    "~/Library/Caches/com.cavaldos.Lumio",
    "~/Library/HTTPStorages/com.cavaldos.Lumio",
    "~/Library/Preferences/noah-code.Lumio.plist",
    "~/Library/Caches/noah-code.Lumio",
    "~/Library/HTTPStorages/noah-code.Lumio",
  ]

  caveats <<~EOS
    Lumio is ad-hoc signed. If macOS still blocks it, run:
      xattr -dr com.apple.quarantine #{appdir}/Lumio.app
    Then open Lumio and press Option+Space.
  EOS
end
