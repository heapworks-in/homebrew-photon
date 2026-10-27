# photon: Homebrew cask template; the release workflow fills 0.1.11-alpha.1 and 79565e7a129328c0ace5dfb97a81a44422badf12c01703b1ff9e157ce99d14f8.
cask "photon" do
  version "0.1.11-alpha.1"
  sha256 "79565e7a129328c0ace5dfb97a81a44422badf12c01703b1ff9e157ce99d14f8"

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
