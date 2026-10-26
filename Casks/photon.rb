# photon: Homebrew cask template; the release workflow fills 0.1.9-alpha.1 and fdad79af7b391e0a287acd8118463f8e4a02f20348fcd514c62020d92f4fe214.
cask "photon" do
  version "0.1.9-alpha.1"
  sha256 "fdad79af7b391e0a287acd8118463f8e4a02f20348fcd514c62020d92f4fe214"

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
