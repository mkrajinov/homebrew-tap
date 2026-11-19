cask "youtube-tool" do
  version "0.3.1"
  sha256 "2be9ed692555083426399b874a6107ab1a735f2bb4d0d5b91ad2f67e1d595adf"

  url "https://github.com/mkrajinov/youtube-tool/releases/download/v#{version}/YouTubeTool-#{version}.zip"
  name "YouTube Tool"
  desc "Download videos and audio from YouTube"
  homepage "https://github.com/mkrajinov/youtube-tool"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "YouTubeTool.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/YouTubeTool.app"]
  end

  zap trash: [
    "~/Library/Application Support/YouTubeTool",
    "~/Library/Caches/io.github.mkrajinov.youtubetool",
    "~/Library/Preferences/io.github.mkrajinov.youtubetool.plist",
    "~/Library/Saved Application State/io.github.mkrajinov.youtubetool.savedState",
  ]
end
