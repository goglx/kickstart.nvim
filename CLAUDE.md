# Neovim Configuration Project

## Project Overview
- **Base**: kickstart.nvim (Neovim configuration template)
- **Structure**: Mostly single-file init.lua with modular plugin organization
- **Personal module**: `thegoglx` (contains a simple hello print)

## Key Components

### Main Configuration (`init.lua`)
- Basic Neovim settings (line numbers, clipboard sync, indentation)
- Extensive plugin setup via lazy.nvim
- Custom keybindings for tabs, file browsing, and navigation
- LSP configuration with Mason for language servers
- Autosave functionality on text changes

### Notable Features
1. **Plugin Manager**: lazy.nvim
2. **Colorscheme**: rose-pine (with tokyonight available)  
3. **Key Plugins**:
   - Telescope (fuzzy finder with file browser)
   - LSP support via nvim-lspconfig + Mason
   - Autocompletion with blink.cmp
   - Treesitter for syntax highlighting
   - Conform for auto-formatting
   - Mini.nvim modules (statusline, surround, textobjects)

### Custom Keymaps
- `<leader>w`: Quick save
- `<leader><tab>` group: Tab management
- `<leader>p` group: Project/file browsing
- `<Ctrl-f>`: tmux sessionizer integration

### File Organization
- `/lua/thegoglx/init.lua`: Personal configuration module
- `/lua/custom/plugins/init.lua`: Empty custom plugins file
- `/lua/kickstart/plugins/`: Additional kickstart plugin modules

The configuration is well-documented and includes comprehensive LSP setup, modern completion, and efficient file navigation tools.