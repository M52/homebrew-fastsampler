cask "fastsampler" do
  version "1.3.3.806"
  sha256 "ad3969bec8c4ea8d25120e552f03f9685374e38088b791769f8c8b4081a5a8ec"

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
