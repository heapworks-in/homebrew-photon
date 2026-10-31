# photon: Homebrew cask template; the release workflow fills 0.1.15-alpha.1 and 2a77645ba70f35d750805bdf448af5912581e1d42d09c3848418a934f23a1c84.
cask "photon" do
  version "0.1.15-alpha.1"
  sha256 "2a77645ba70f35d750805bdf448af5912581e1d42d09c3848418a934f23a1c84"

  url "https://github.com/heapworks-in/photon/releases/download/photon-v#{version}/Photon-aarch64.dmg"
  name "Photon"
  desc "Fast native terminal and code editor"
  homepage "https://github.com/heapworks-in/photon"

  depends_on arch: :arm64

  app "Photon.app"
  binary "#{appdir}/Photon.app/Contents/MacOS/cli", target: "photon"

  # Alpha builds aren't notarized yet, so Gatekeeper would refuse to open them.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Photon.app"]
  end

  zap trash: [
    "~/Library/Application Support/Photon",
    "~/Library/Logs/Photon",
  ]
end
