cask "youtube-tool" do
  version "0.1.1"
  sha256 "cb765ee15b8c2beaf31a68bd1cadbed4a3f92a887c9e209add2461e165a1a9c3"

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
