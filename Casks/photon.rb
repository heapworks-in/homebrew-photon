# photon: Homebrew cask template; the release workflow fills 0.1.13-alpha.1 and 6a39ed0f5bf0bcbd3a93a1c6feb9a95ae84c87c7c9c37e727fa73a7e0267a413.
cask "photon" do
  version "0.1.13-alpha.1"
  sha256 "6a39ed0f5bf0bcbd3a93a1c6feb9a95ae84c87c7c9c37e727fa73a7e0267a413"

  url "https://github.com/heapworks-in/photon/releases/download/photon-v#{version}/Photon-aarch64.dmg"
  name "Photon"
  desc "Fast native terminal and code editor"
  homepage "https://github.com/heapworks-in/photon"

  depends_on arch: :arm64

  app "Photon.app"
  binary "#{appdir}/Photon.app/Contents/MacOS/cli", target: "photon"

  # Alpha builds aren't notarized yet, so Gatekeeper would refuse to open them.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Photon.app"]
  end

  zap trash: [
    "~/Library/Application Support/Photon",
    "~/Library/Logs/Photon",
  ]
end
