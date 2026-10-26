# photon: Homebrew cask template; the release workflow fills 0.1.8-alpha.1 and 5ee0381d963dbb87709976b2e978f92743ee6fb90fe0d23b9b2cd2414d3539fe.
cask "photon" do
  version "0.1.8-alpha.1"
  sha256 "5ee0381d963dbb87709976b2e978f92743ee6fb90fe0d23b9b2cd2414d3539fe"

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
