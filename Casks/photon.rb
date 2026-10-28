# photon: Homebrew cask template; the release workflow fills 0.1.12-alpha.1 and bbfa4d25e3e2f52567bc8475eb5d4d32eb3f4699a2f4319ca0b34e86ff5ef20e.
cask "photon" do
  version "0.1.12-alpha.1"
  sha256 "bbfa4d25e3e2f52567bc8475eb5d4d32eb3f4699a2f4319ca0b34e86ff5ef20e"

  url "https://github.com/heapworks-in/photon/releases/download/photon-v#{version}/Photon-aarch64.dmg"
  name "Photon"
  desc "Fast native terminal and code editor"
  homepage "https://github.com/heapworks-in/photon"

  depends_on arch: :arm64

  app "Photon.app"
  binary "#{appdir}/Photon.app/Contents/MacOS/cli", target: "photon"

  # Alpha builds aren't notarized yet, so Gatekeeper would refuse to open them.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Photon.app"]
  end

  zap trash: [
    "~/Library/Application Support/Photon",
    "~/Library/Logs/Photon",
  ]
end
