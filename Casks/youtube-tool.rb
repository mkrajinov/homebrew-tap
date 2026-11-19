cask "youtube-tool" do
  version "0.1.3"
  sha256 "642fd2b0a5b02d3e007ab36a9c54b280f13c6aa9c35994559b6af3629211febf"

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
