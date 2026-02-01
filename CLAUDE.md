# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS development environment configuration. Manages shell configuration with lazy loading for fast startup (~0.15s).

## Architecture

### ZSH File Loading Order

```
~/.zshenv     → Minimal, runs for ALL shells
~/.zprofile   → Login-only, Homebrew init
~/.zshrc      → Main config, sources index.sh
~/.zlogin     → Empty (unused)
```

### Modular Configuration Structure

```
.zshrc (entry point)
└── zsh/index.sh (loader)
    ├── core/lazy.sh    → Lazy loading utilities (loaded first)
    ├── core/init.sh    → Oh-my-zsh, prompt
    ├── core/general.sh → Key bindings, navigation
    ├── core/alias.sh   → Common aliases
    ├── langs/          → npm, python, go, rust, wasm
    ├── tools/          → docker, git, mani
    ├── cloud/          → kubectl, terraform, aws, gcloud
    └── env/            → flutter, 42sg, nyp
```

### Lazy Loading

Expensive tools are lazy-loaded (only initialized on first use):
- **Node.js**: fnm, pnpm, bun
- **Python**: pyenv, conda
- **Go**: gvm, golangci-lint completion
- **Cloud**: kubectl/aws/terraform/gcloud completions
- **Ruby**: rvm

Use the `lazy_load` function in `core/lazy.sh`:
```zsh
lazy_load "trigger_commands" 'initialization_code'
```

## Common Commands

```bash
# Reload shell configuration
source ~/.zshrc

# Benchmark startup time
/usr/bin/time zsh -i -c exit

# Test specific module
source ~/.config/zsh/cloud/terraform.sh

# Install Homebrew packages
brew bundle --file=~/.config/Brewfile
```

## Key Aliases

| Command | Alias |
|---------|-------|
| terraform | `tf`, `tfp` (plan), `tfa` (apply) |
| kubectl | `k`, `kgp` (get pods), `kgd` (get deployments) |
| docker-compose | `dc`, `dcu` (up), `dcd` (down) |
| lazygit | `lg` |

## Adding New Configuration

1. Create `.sh` file in appropriate `zsh/` subdirectory
2. For expensive operations, use `lazy_load` from `core/lazy.sh`
3. Test with `source ~/.zshrc`
4. Completions should use `compdef` for lazy loading

## Performance Notes

- `compinit` runs once at end of index.sh with 24h cache
- Avoid `$(brew --prefix)` - cache the value instead
- Use `[[ -f file ]]` not `[ -f file ]` (faster in zsh)
- Removed: nvm (use fnm), duplicate PATH entries, multiple compinit calls
