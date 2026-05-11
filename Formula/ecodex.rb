class Ecodex < Formula
  desc "Empirica's epistemic agent environment — a fork of openai/codex with measured discipline"
  homepage "https://github.com/Nubaeon/ecodex"
  url "https://github.com/Nubaeon/ecodex/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "de6e584ef9737fead00d1e8c0be99377aef23f136c98988dd094011845b203f2"
  license "Apache-2.0"
  head "https://github.com/Nubaeon/ecodex.git", branch: "build/v1-plugin"

  depends_on "rust" => :build

  def install
    cd "codex-rs" do
      system "cargo", "install", *std_cargo_args(path: "cli")
    end
  end

  test do
    assert_match "ecodex", shell_output("#{bin}/ecodex --version")
  end
end
