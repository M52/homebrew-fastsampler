cask "fastsampler" do
  version "1.3.1.745"
  sha256 "ddbffe9d9c314eb5b8f18eb0edb73f85037d97b1bcc29411a082f9f0496f99c2"

  url "https://github.com/M52/fastsampler-downloads/releases/download/v#{version}/FastSampler-macos-universal.zip",
      verified: "github.com/M52/fastsampler-downloads/"
  name "FastSampler"
  desc "Small and performant VST3 sampler"
  homepage "https://fastsampler.matthiascalis.nl/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  vst3_plugin "FastSampler.vst3"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine",
                          "#{Dir.home}/Library/Audio/Plug-Ins/VST3/FastSampler.vst3"]
  end

  zap trash: [
    "~/Library/Application Support/FastSampler",
  ]
end
