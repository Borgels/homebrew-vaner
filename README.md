# homebrew-vaner

[Homebrew](https://brew.sh) tap for [Vaner](https://vaner.ai) — predictive context middleware for AI workflows.

## Install

```bash
# CLI / daemon (Python, from PyPI):
brew install Borgels/vaner/vaner

# Desktop companion (macOS .app):
brew install --cask Borgels/vaner/vaner-desktop
```

The `Borgels/vaner` prefix is the tap shorthand — Homebrew auto-clones [`Borgels/homebrew-vaner`](https://github.com/Borgels/homebrew-vaner) on first use. Subsequent installs of either formula update through `brew update` like any core formula.

## Two install paths

- **CLI** (`brew install vaner`) — `pipx`-style isolation for the Python `vaner` CLI without touching system Python. Targets developers, CI, and anyone wiring Vaner into an MCP-aware editor (Claude Code, Cursor, Codex CLI, …) by hand.
- **Desktop** (`brew install --cask vaner-desktop`) — drops the Vaner Desktop `.app` into `/Applications/`. Bundles the same daemon under the hood, plus a menu-bar companion + first-run onboarding wizard. Right answer for most users.

The two are complementary, not redundant. `vaner` (CLI) on its own works for power users; the desktop cask is the front door for non-developers.

## Releasing a new version

When a new `vaner` release ships on PyPI:

```bash
NEW=0.8.11
sha256=$(curl -s https://pypi.org/pypi/vaner/$NEW/json | jq -r '.urls[] | select(.packagetype=="sdist") | .digests.sha256')
url=$(curl -s https://pypi.org/pypi/vaner/$NEW/json | jq -r '.urls[] | select(.packagetype=="sdist") | .url')
sed -i '' "s|url \".*|url \"$url\"|"          Formula/vaner.rb
sed -i '' "s|sha256 \".*|sha256 \"$sha256\"|" Formula/vaner.rb
brew audit --strict --online Formula/vaner.rb
```

When `vaner-desktop` ships a new `.dmg`:

```bash
NEW=0.1.2
sha256=$(curl -sL https://github.com/Borgels/vaner-desktop-macos/releases/download/v$NEW/vaner-$NEW.dmg.sha256 | awk '{print $1}')
sed -i '' "s|version \".*|version \"$NEW\"|"  Casks/vaner-desktop.rb
sed -i '' "s|sha256 \".*|sha256 \"$sha256\"|" Casks/vaner-desktop.rb
brew audit --strict --online Casks/vaner-desktop.rb
```

When the macOS desktop consolidates onto the cross-platform Tauri build at `Borgels/vaner-desktop`, the cask URL switches at that point.

## License

Apache-2.0 — same as Vaner.
