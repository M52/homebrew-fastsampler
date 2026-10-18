cask "fastsampler" do
  version "1.3.2.803"
  sha256 "b26657435b08424fd3fd3207b19e0aae14d522b1ba533594c8be41d34f57adc2"

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
  audio_unit_plugin "FastSampler.component"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine",
                          "#{Dir.home}/Library/Audio/Plug-Ins/VST3/FastSampler.vst3",
                          "#{Dir.home}/Library/Audio/Plug-Ins/Components/FastSampler.component"]
  end

  zap trash: [
    "~/Library/Application Support/FastSampler",
  ]
end
