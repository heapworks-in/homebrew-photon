# photon: Homebrew cask template; the release workflow fills 0.1.7-alpha.1 and 95e6abd5e59dda89b72460d5285d9ee5e061d61f62429ccfd3a3a6d32d7f1004.
cask "photon" do
  version "0.1.7-alpha.1"
  sha256 "95e6abd5e59dda89b72460d5285d9ee5e061d61f62429ccfd3a3a6d32d7f1004"

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
