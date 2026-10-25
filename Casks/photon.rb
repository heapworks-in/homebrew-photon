# photon: Homebrew cask template; the release workflow fills 0.1.5-alpha.1 and c77e92ee6c8e420f1d9c55c3a80e6ad727581c390d50e4f51f21f11a2724e3ba.
cask "photon" do
  version "0.1.5-alpha.1"
  sha256 "c77e92ee6c8e420f1d9c55c3a80e6ad727581c390d50e4f51f21f11a2724e3ba"

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
