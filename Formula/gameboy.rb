class Gameboy < Formula
  desc "Terminal-rendered Game Boy emulator written in Rust"
  homepage "https://github.com/raphamorim/gameboy"
  version "0.1.5"
  license "MPL-2.0"

  on_macos do
    on_arm do
      url "https://raw.githubusercontent.com/ifsin/homebrew-tap/main/releases/gameboy/0.1.5/gameboy-darwin-arm64"
      sha256 "1c3cce680dd47a6b2f43ef46a1fdf930ceadb4ea89737f0de9cb8e90288ef267"
    end
    on_intel do
      url "https://raw.githubusercontent.com/ifsin/homebrew-tap/main/releases/gameboy/0.1.5/gameboy-darwin-amd64"
      sha256 "01abe5a11150ee39ae7f6cb6a5750f09f269e4c74db19a344b6ca3ad15d162c6"
    end
  end

  def install
    bin.install Dir["gameboy-*"].first => "gameboy"
  end

  test do
    assert_match "usage: gameboy", shell_output("#{bin}/gameboy 2>&1", 1)

    assert_match "Failed to read",
      shell_output("#{bin}/gameboy #{testpath}/missing.gb 2>&1", 1)
  end
end
