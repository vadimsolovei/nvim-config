# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **kickstart.nvim** configuration - a modular Neovim setup based on the kickstart.nvim template. It's designed as a starting point for personal customization with a well-organized, readable structure.

**Core Philosophy**: All configuration is readable, understandable, and modifiable. Every feature is documented with comments explaining what it does and why.

## Architecture

### Modular File Structure

```
~/.config/nvim/
├── init.lua                              # Main entry point - loads lazy.nvim and imports modules
├── lua/
│   ├── core/
│   │   ├── options.lua                   # Vim options (line numbers, tabs, clipboard, etc.)
│   │   ├── keymaps.lua                   # Basic keymaps (non-plugin)
│   │   └── autocmds.lua                  # Autocommands (yank highlight, etc.)
│   ├── plugins/
│   │   ├── lsp.lua                       # LSP config (lspconfig, mason, lazydev, fidget)
│   │   ├── completion.lua                # blink.cmp + LuaSnip
│   │   ├── telescope.lua                 # Fuzzy finding
│   │   ├── ui.lua                        # Colorscheme, which-key, statusline, todo-comments
│   │   ├── editor.lua                    # Treesitter, mini.nvim, autopairs, indent-blankline
│   │   ├── git.lua                       # Gitsigns, neogit
│   │   ├── formatting.lua                # Conform.nvim
│   │   ├── linting.lua                   # nvim-lint
│   │   ├── debug.lua                     # DAP setup (nvim-dap, dap-ui, dap-go)
│   │   ├── navigation.lua                # Harpoon, neo-tree
│   │   └── misc.lua                      # Comment.nvim
│   └── custom/
│       └── autosave.lua                  # Custom autosave on focus lost
```

### How Modules Are Loaded

1. **init.lua** (main entry point):
   - Sets leader keys
   - Bootstraps lazy.nvim plugin manager
   - Imports all plugin modules via `{ import = 'plugins.X' }`
   - Requires core modules (`core.options`, `core.keymaps`, `core.autocmds`)
   - Requires custom modules (`custom.autosave`)

2. **Plugin modules** return Lua tables that lazy.nvim consumes as plugin specifications

3. **Core modules** execute directly when required, setting up Vim options, keymaps, and autocommands

### Plugin Management

Uses **lazy.nvim** as the plugin manager. Each file in `lua/plugins/` returns a table (or array of tables) containing plugin specifications.

**Plugin specification pattern:**
```lua
-- In any lua/plugins/*.lua file
return {
  {
    'plugin/name',
    dependencies = { 'other/plugin' },
    opts = { ... },  -- Auto-calls setup()
    config = function() ... end,  -- For manual setup
  },
}
```

## Development Commands

### Plugin Management
```vim
:Lazy                    " Open plugin manager UI
:Lazy update             " Update all plugins
:Lazy sync               " Install missing + update + clean
:Lazy clean              " Remove unused plugins
```

### LSP & Tools
```vim
:Mason                   " Open Mason tool installer UI
:LspInfo                 " Show LSP client status for current buffer
:ConformInfo             " Show formatter info for current buffer
:checkhealth             " Comprehensive health check
```

### Treesitter
```vim
:TSUpdate                " Update parsers
:TSInstallInfo           " Show parser installation status
```

### Debugging (DAP)
```vim
:DapContinue             " Start/continue debugging
:DapToggleBreakpoint     " Toggle breakpoint at current line
```
Function keys: `F5` (continue), `F1` (step into), `F2` (step over), `F3` (step out), `F7` (toggle DAP UI)

## Key Binding Patterns

Leader key: `<space>`

**LSP Keymaps** (lua/plugins/lsp.lua, only active when LSP attached):
- `grn` - Rename symbol
- `gra` - Code actions
- `grr` - Find references (Telescope)
- `grd` - Go to definition (Telescope)
- `gri` - Go to implementation (Telescope)
- `grt` - Go to type definition (Telescope)
- `grD` - Go to declaration
- `gO` - Document symbols (Telescope)
- `gW` - Workspace symbols (Telescope)

**Telescope Keymaps** (lua/plugins/telescope.lua):
- `<leader>sf` - Find files
- `<leader>sg` - Live grep
- `<leader>sw` - Grep current word
- `<leader>sd` - Search diagnostics
- `<leader>sh` - Search help tags
- `<leader>sk` - Search keymaps
- `<leader>sn` - Search Neovim config files
- `<leader><leader>` - Find buffers
- `<leader>/` - Fuzzy find in current buffer

**Harpoon Keymaps** (lua/plugins/navigation.lua):
- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon menu
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` - Jump to files 1-4

**Git Keymaps** (lua/plugins/git.lua):
- `]c` / `[c` - Next/previous git hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hd` - Diff against index

**Other Important Keymaps**:
- `<leader>f` - Format buffer (lua/plugins/formatting.lua)
- `<leader>q` - Open diagnostic quickfix list (lua/core/keymaps.lua)
- `<leader>th` - Toggle inlay hints (lua/plugins/lsp.lua)
- `\` - Toggle Neo-tree file explorer (lua/plugins/navigation.lua)
- `<Esc>` in normal mode - Clear search highlights (lua/core/keymaps.lua)

## Adding New Functionality

### Adding a Plugin
1. **Choose the appropriate category** (or create a new plugin file in `lua/plugins/`)
2. **Add to existing file** or create new file (e.g., `lua/plugins/myfeature.lua`)
3. **Return a plugin spec**:
   ```lua
   return {
     {
       'author/plugin-name',
       opts = { ... },
     },
   }
   ```
4. **Restart Neovim** - Lazy will auto-install

### Adding an LSP Server
Edit `lua/plugins/lsp.lua`:
1. Add server to `servers` table (around line 210)
2. Configure server-specific settings if needed
3. Add to `ensure_installed` for auto-installation (around line 255)
4. Restart Neovim

### Adding a Formatter
Edit `lua/plugins/formatting.lua`:
1. Add to `formatters_by_ft` table (around line 34)
2. Optionally configure formatter in `formatters` table (around line 51)

### Adding a Linter
Edit `lua/plugins/linting.lua`:
1. Add to `lint.linters_by_ft` table (around line 8)

### Disabling a Plugin Category
In `init.lua`, comment out the import line:
```lua
-- { import = 'plugins.debug' },  -- Disable debugging support
```

## Important Configuration Details

### Editor Settings (lua/core/options.lua)
- Tab width: 2 spaces (expandtab enabled)
- Relative line numbers enabled
- System clipboard integration (scheduled after startup)
- Scroll offset: 10 lines
- Confirm dialog for unsaved changes
- Inccommand: 'split' (live substitution preview)

### LSP Configuration (lua/plugins/lsp.lua)
- Uses **blink.cmp** for completion capabilities
- LSP servers configured: TypeScript/JavaScript (ts_ls, html, cssls, jsonls, yamlls), Lua (lua_ls)
- Diagnostic config: rounded borders, ERROR underlines only, virtual text enabled
- Auto-highlights references under cursor after delay

### Telescope Configuration (lua/plugins/telescope.lua)
- Layout: Vertical at 90% screen size
- Preview height: 60% of window
- FZF native sorter enabled (requires `make`)

### Format on Save (lua/plugins/formatting.lua)
- Enabled by default via conform.nvim
- Exceptions: C/C++ files disabled
- Prettier configured to use `npx prettier`

### Custom Features
- **Autosave** (lua/custom/autosave.lua): Auto-saves buffers on VimSuspend/VimLeavePre events

## External Dependencies

**Required:**
- Neovim >= 0.10 (stable) or nightly
- `git`, `make`, `unzip`, C compiler (gcc)
- `ripgrep` - for telescope grep
- `fd-find` - for telescope file finding
- Clipboard tool: xclip/xsel/win32yank (platform-dependent)

**Language-Specific:**
- `npm` - for Prettier, TypeScript tools
- `go` - for delve debugger (if using DAP)

**Optional:**
- Nerd Font - for icons (set `vim.g.have_nerd_font = true` in init.lua)

## Testing Changes

1. **Check health**: Run `:checkhealth` to verify all dependencies
2. **Test LSP**: Open a file of the target language, run `:LspInfo`
3. **Test formatters**: Use `<leader>f` or check `:ConformInfo`
4. **Plugin issues**: Check `:Lazy` UI, look for errors in red
5. **Startup errors**: Run `nvim --startuptime startup.log` to profile
6. **Check logs**: `:messages` for error messages

## File Reference Guide

Quick reference for where to find/edit specific functionality:

| What you want to change | File to edit |
|------------------------|--------------|
| Vim options (tabs, numbers, etc.) | `lua/core/options.lua` |
| Basic keymaps | `lua/core/keymaps.lua` |
| Autocommands | `lua/core/autocmds.lua` |
| LSP servers | `lua/plugins/lsp.lua` |
| Completion behavior | `lua/plugins/completion.lua` |
| Telescope settings/keymaps | `lua/plugins/telescope.lua` |
| Colorscheme | `lua/plugins/ui.lua` |
| Statusline | `lua/plugins/ui.lua` (mini.statusline) |
| Treesitter languages | `lua/plugins/editor.lua` |
| Formatters | `lua/plugins/formatting.lua` |
| Linters | `lua/plugins/linting.lua` |
| Git keymaps | `lua/plugins/git.lua` |
| File navigation | `lua/plugins/navigation.lua` |
| Debug adapters | `lua/plugins/debug.lua` |

## Notes for Modifications

- **Modular design**: Keep related functionality in the appropriate category file
- **Comment style**: Preserve extensive comments for teaching/reference
- **Lazy loading**: Most plugins use `event`, `keys`, or `ft` for optimal startup time
- **Custom path**: Use `lua/custom/` for personal modifications
- **Plugin returns**: Each plugin file must return a table or array of tables
- **Core requires**: Core modules execute immediately when required from init.lua
