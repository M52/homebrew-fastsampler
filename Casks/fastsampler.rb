cask "fastsampler" do
  version "1.2.0.706"
  sha256 "95e58dd92efabd053a0ef9dbd94059e22d04903e7eaae77f4514af73d83290e7"

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
