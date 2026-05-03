class Gameboyadv < Formula
  desc "Terminal-rendered Game Boy Advance emulator written in Rust"
  homepage "https://github.com/michelhe/rustboyadvance-ng"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ifsin/homebrew-tap/releases/download/res/gameboyadv-darwin-arm64"
      sha256 "f34dc8d8d39cf554c6b42f13f36ec855ecb42854d592065f06a55b738713ff36"
    end
    on_intel do
      url "https://github.com/ifsin/homebrew-tap/releases/download/res/gameboyadv-darwin-amd64"
      sha256 "9c82161eeebfaef6e80d18a73e5a037aa1e201c93799c9b81006c9b43b550e6f"
    end
  end

  def install
    libexec.install Dir["gameboyadv-*"].first => "gameboyadv"
    chmod 0755, libexec/"gameboyadv"

    (bin/"gameboyadv").write <<~SH
      #!/bin/bash
      exec "#{libexec}/gameboyadv" --skip-bios --rtc "$@"
    SH
  end

  test do
    assert_match "Usage: gameboyadv", shell_output("#{libexec}/gameboyadv --help 2>&1")
  end
end
