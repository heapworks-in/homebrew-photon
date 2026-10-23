# photon: Homebrew cask template; the release workflow fills 0.1.2-alpha.1 and 2857e83cbb586a6f878502edb70bd10113a6b8d66d3a6bbb8c52bc1e3dd267f6.
cask "photon" do
  version "0.1.2-alpha.1"
  sha256 "2857e83cbb586a6f878502edb70bd10113a6b8d66d3a6bbb8c52bc1e3dd267f6"

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
