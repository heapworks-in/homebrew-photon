# photon: Homebrew cask template; the release workflow fills 0.1.14-alpha.1 and dc7d17ebc10aea5be9547a4b9b4d5a8666767f3f33d7cfaefd2305751a4f96e0.
cask "photon" do
  version "0.1.14-alpha.1"
  sha256 "dc7d17ebc10aea5be9547a4b9b4d5a8666767f3f33d7cfaefd2305751a4f96e0"

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
