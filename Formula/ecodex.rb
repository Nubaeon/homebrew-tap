class Ecodex < Formula
  desc "Empirica's epistemic agent environment — a fork of openai/codex with measured discipline"
  homepage "https://github.com/Nubaeon/ecodex"
  url "https://github.com/Nubaeon/ecodex/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "12a00cfa5f51dcee2dccabba65d99340f52c8e0013af069ae7e502679b010d90"
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
