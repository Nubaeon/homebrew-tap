# Homebrew Formula for Empirica
# Documentation: https://docs.brew.sh/Formula-Cookbook
#
# Installation:
#   brew tap nubaeon/tap
#   brew install empirica

class Empirica < Formula
  include Language::Python::Virtualenv

  desc "Epistemic self-assessment framework for AI agents"
  homepage "https://github.com/Nubaeon/empirica"
  url "https://files.pythonhosted.org/packages/source/e/empirica/empirica-1.3.0.tar.gz"
  sha256 "57b9efe042ea552725be88c96f0a4291e3a2b8c4fcb0aa5fc616ecc9f5189040"
  license "MIT"

  depends_on "python@3.11"

  # Runtime Python dependencies
  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/source/p/pyyaml/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic/pydantic-2.5.3.tar.gz"
    sha256 "b3ef57c62535b0941697cce638c08f891e2a71f035e8b5f8234eb41e1b1c6b91"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # Test that the CLI works
    assert_match "1.3.0", shell_output("#{bin}/empirica --version")

    # Test Python import
    system Formula["python@3.11"].opt_bin/"python3", "-c", "from empirica.cli.cli_core import main"
  end
end
