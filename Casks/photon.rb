# photon: Homebrew cask template; the release workflow fills 0.1.4-alpha.1 and c12a839bfce4237312f8db8f12a0603d72927fad3207d4f4ae7afafe0dacb43a.
cask "photon" do
  version "0.1.4-alpha.1"
  sha256 "c12a839bfce4237312f8db8f12a0603d72927fad3207d4f4ae7afafe0dacb43a"

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
