# photon: Homebrew cask template; the release workflow fills 0.1.10-alpha.1 and 55100f75d9cacad7f40906860f53117a561ebfbdca2f06f93b75942a5641279f.
cask "photon" do
  version "0.1.10-alpha.1"
  sha256 "55100f75d9cacad7f40906860f53117a561ebfbdca2f06f93b75942a5641279f"

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
