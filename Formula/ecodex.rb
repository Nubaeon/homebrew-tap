class Ecodex < Formula
  desc "Empirica's epistemic agent environment — a fork of openai/codex with measured discipline"
  homepage "https://github.com/Nubaeon/ecodex"
  url "https://github.com/Nubaeon/ecodex/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8c2de30ecbde9ff0554cc507701ff13cd00c0cb7a590e7452d8bd42e3210f4b0"
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
