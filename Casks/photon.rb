# photon: Homebrew cask template; the release workflow fills 0.1.3-alpha.1 and 43f9067cb07dbf37c4bedb39bda4e8facfe9ca9f9974156553418129926a8e3a.
cask "photon" do
  version "0.1.3-alpha.1"
  sha256 "43f9067cb07dbf37c4bedb39bda4e8facfe9ca9f9974156553418129926a8e3a"

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
