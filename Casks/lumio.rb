cask "lumio" do
  version "0.0.3"
  sha256 "55f032d6ee197b8136c1f4fe19ec0d3cdd2d2f0fdd694ad5c63302613395ce3f"

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

  uninstall quit: "noah-code.Lumio"

  zap trash: [
    "~/.lumio",
    "~/Library/Application Support/lumio",
    "~/Library/Preferences/noah-code.Lumio.plist",
  ]

  caveats <<~EOS
    Lumio is ad-hoc signed. If macOS still blocks it, run:
      xattr -dr com.apple.quarantine #{appdir}/Lumio.app
    Then open Lumio and press Option+Space.
  EOS
end
