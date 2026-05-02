# SPDX-License-Identifier: Apache-2.0
#
# Vaner — predictive context middleware for AI workflows.
#
# Installs the `vaner` CLI from PyPI into a private virtualenv. Picks
# up Python 3.13 from Homebrew's `python@3.13` formula so the formula
# stays self-contained and doesn't fight the system Python.

class Vaner < Formula
  include Language::Python::Virtualenv

  desc "Predictive context middleware for AI workflows (CLI + daemon)"
  homepage "https://vaner.ai"
  url "https://files.pythonhosted.org/packages/1e/89/90312ebacd99e292054531cbc5e2e7ec9b8b6814132e37a69ab20a4045b7/vaner-0.8.10.tar.gz"
  sha256 "2b23d0a68da5962d476fba597c3487a303adce6d39bf56d3f17d9ee94274af6b"
  license "Apache-2.0"

  depends_on "python@3.13"

  # Resource list deliberately empty — `pip install vaner` resolves the
  # full transitive set from PyPI at install time. Keeping resources
  # out of the formula avoids manually mirroring every dep upgrade
  # against this tap. Run `brew audit --strict` periodically and bump
  # the formula's `url` + `sha256` after each `vaner` PyPI release.
  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install_and_link buildpath
  end

  test do
    output = shell_output("#{bin}/vaner --version")
    assert_match "vaner #{version}", output
  end
end
