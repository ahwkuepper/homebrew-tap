cask "vesta-hue" do
  version "0.2.0"
  sha256 "c8f13bbe140b5b022050b6db9657d9ae4b7e40a62d59968b23b943031acdfae3"

  url "https://github.com/ahwkuepper/Vesta/releases/download/v#{version}/Vesta-#{version}.dmg"
  name "Vesta"
  desc "Menu bar controller for Philips Hue lights"
  homepage "https://github.com/ahwkuepper/Vesta"

  livecheck do
    skip "Releases are promoted manually after notarized assets are published"
  end

  conflicts_with cask: "vesta"
  depends_on macos: :sonoma

  app "Vesta.app"

  uninstall quit: "io.github.ahwkuepper.Vesta"
end
