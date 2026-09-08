cask "fastsampler" do
  version "1.1.0.650"
  sha256 "d908965127c98356d086e2a659221d52d4b2be9c8305737c3a90e07d1886ecde"

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
