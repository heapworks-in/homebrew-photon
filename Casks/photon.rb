# photon: Homebrew cask template; the release workflow fills 0.1.6-alpha.1 and 756f85aacfdb0f29b0e876fcd284d7e8a8c7435e9201783fd7a94009a1276aaa.
cask "photon" do
  version "0.1.6-alpha.1"
  sha256 "756f85aacfdb0f29b0e876fcd284d7e8a8c7435e9201783fd7a94009a1276aaa"

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
