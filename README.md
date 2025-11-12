# Kickstart Neovim Configuration

A modular, well-documented Neovim configuration based on kickstart.nvim. Designed to be readable, understandable, and easy to customize.

## Philosophy

Every feature is documented with comments explaining what it does and why. All configuration is organized into logical modules for easy navigation and modification.

## Features Overview

### Core Editor Features
- **Line Numbers**: Relative line numbers with absolute current line
- **Smart Indentation**: 2-space tabs with auto-indent
- **System Clipboard Integration**: Seamless copy/paste with system clipboard
- **Search**: Incremental search with smart case sensitivity
- **Split Windows**: Intelligent split behavior (right/below)
- **Persistent Undo**: Undo history saved between sessions
- **Mouse Support**: Full mouse support in all modes

### Plugin Manager

**[lazy.nvim](https://github.com/folke/lazy.nvim)**
- Modern plugin manager with lazy loading
- Fast startup times through deferred loading
- Built-in plugin update management
- Commands: `:Lazy`, `:Lazy update`, `:Lazy sync`

## Installed Plugins by Category

### Language Server Protocol (LSP)

**[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**
- Configures LSP servers for code intelligence
- Provides go-to-definition, hover docs, diagnostics
- Pre-configured servers: TypeScript, Lua, HTML, CSS, JSON, YAML

**[mason.nvim](https://github.com/williamboman/mason.nvim)** + **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**
- Automatic LSP server installation and management
- UI for installing language servers, formatters, linters
- Command: `:Mason`

**[lazydev.nvim](https://github.com/folke/lazydev.nvim)**
- Enhanced Lua development for Neovim config
- Auto-completion for Neovim API and plugin APIs

**[fidget.nvim](https://github.com/j-hui/fidget.nvim)**
- LSP progress notifications
- Shows "loading..." indicators for LSP operations

**Key LSP Keybindings:**
- `grn` - Rename symbol
- `gra` - Code actions
- `grr` - Find references
- `grd` - Go to definition
- `gri` - Go to implementation
- `grt` - Go to type definition
- `K` - Hover documentation
- `<leader>th` - Toggle inlay hints

### Completion

**[blink.cmp](https://github.com/Saghen/blink.cmp)**
- Modern completion engine with snippet support
- Auto-completion for LSP, buffer text, paths
- Integrates with LuaSnip for snippets
- Keybindings: `<C-n>`/`<C-p>` to navigate, `<C-y>` to accept

**[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** + **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)**
- Snippet engine with extensive snippet library
- Supports snippet expansion in completion

### Fuzzy Finding

**[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**
- Powerful fuzzy finder for files, text, symbols, and more
- Beautiful UI with live preview
- **Key Keybindings:**
  - `<leader>sf` - Find files
  - `<leader>sg` - Live grep (search text)
  - `<leader>sw` - Grep current word
  - `<leader>sd` - Search diagnostics
  - `<leader>sh` - Search help tags
  - `<leader>sk` - Search keymaps
  - `<leader>sn` - Search Neovim config files
  - `<leader><leader>` - Find buffers
  - `<leader>/` - Fuzzy find in current buffer

**Dependencies:**
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility library
- **[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** - Fast native FZF sorter
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File icons

### Syntax Highlighting & Parsing

**[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**
- Modern syntax highlighting using tree-sitter
- Intelligent code folding and indentation
- Incremental selection and refactoring support
- Commands: `:TSUpdate`, `:TSInstallInfo`

**[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)**
- Text objects based on syntax tree (functions, classes, etc.)
- Navigate and select by semantic meaning

### Git Integration

**[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**
- Git decorations in the sign column
- Inline blame and hunk preview
- **Key Keybindings:**
  - `]c` / `[c` - Next/previous git hunk
  - `<leader>hs` - Stage hunk
  - `<leader>hr` - Reset hunk
  - `<leader>hp` - Preview hunk
  - `<leader>hb` - Blame line
  - `<leader>hd` - Diff against index

**[neogit](https://github.com/NeogitOrg/neogit)**
- Magit-like Git interface for Neovim
- Full-featured Git client with commit, push, pull, rebase
- Command: `:Neogit`

**[diffview.nvim](https://github.com/sindrets/diffview.nvim)**
- Advanced diff viewing for Git
- File history browser and merge conflict resolution

### Code Formatting

**[conform.nvim](https://github.com/stevearc/conform.nvim)**
- Async formatting engine
- Format on save enabled by default
- Pre-configured formatters: Prettier, stylua
- Keybinding: `<leader>f` - Format buffer
- Command: `:ConformInfo`

### Linting

**[nvim-lint](https://github.com/mfussenegger/nvim-lint)**
- Async linting engine
- Displays linting errors as diagnostics
- Configured to run on enter, save, and text change

### Debugging (DAP)

**[nvim-dap](https://github.com/mfussenegger/nvim-dap)**
- Debug Adapter Protocol support
- Debug applications directly in Neovim

**[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)**
- Beautiful UI for debugging
- Shows variables, stack trace, breakpoints
- Keybinding: `F7` - Toggle DAP UI

**[nvim-dap-go](https://github.com/leoluz/nvim-dap-go)**
- Go debugging support with delve

**Debug Keybindings:**
- `F5` - Continue/Start debugging
- `F1` - Step into
- `F2` - Step over
- `F3` - Step out
- `<leader>b` - Toggle breakpoint

### User Interface

**[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**
- Beautiful colorscheme with multiple variants
- High contrast and readable

**[which-key.nvim](https://github.com/folke/which-key.nvim)**
- Displays popup with keybindings as you type
- Shows available keys and their descriptions

**[mini.nvim](https://github.com/echasnovski/mini.nvim)**
Modular collection of small plugins:
- **mini.statusline** - Minimal statusline with file info and LSP status
- **mini.icons** - Icon provider for file types
- **mini.ai** - Enhanced text objects (around/inside)
- **mini.comment** - Fast commenting with `gcc` and `gc` motions

**[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**
- Highlights TODO, FIXME, NOTE comments
- Search and navigate todos with Telescope
- Keybinding: `]t` / `[t` - Next/previous todo

**[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)**
- Displays indent guides with scope highlighting
- Visual guide for code structure

### File Navigation

**[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**
- File explorer sidebar
- File operations, search, Git integration
- Keybinding: `\` - Toggle Neo-tree

**[harpoon](https://github.com/ThePrimeagen/harpoon)** (branch: harpoon2)
- Quick file navigation and marking
- Jump between frequently used files
- **Keybindings:**
  - `<leader>a` - Add file to Harpoon
  - `<C-e>` - Toggle Harpoon menu
  - `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` - Jump to files 1-4

**[flash.nvim](https://github.com/folke/flash.nvim)**
- Enhanced navigation with labeled jump points
- Jump to any visible location quickly
- Treesitter-aware jumping for semantic navigation
- **Keybindings:**
  - `s` - Flash jump (jump to any visible location)
  - `S` - Flash Treesitter (jump to treesitter nodes like functions, classes)
  - `r` - Remote Flash (operator-pending mode)
  - `R` - Treesitter Search (visual/operator-pending modes)
  - Enhanced `f`, `F`, `t`, `T`, `;`, `,` motions with labels
  - `<C-s>` - Toggle Flash Search (in command mode during `/` search)

### Editor Enhancements

**[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**
- Automatically close brackets, quotes, etc.
- Integrates with completion

**[Comment.nvim](https://github.com/numToStr/Comment.nvim)**
- Smart commenting with support for multiple languages
- Keybindings: `gcc` (line), `gc` (motion), `gbc` (block)

### Custom Features

**Autosave**
- Automatically saves modified buffers on focus lost or exit
- Prevents data loss when switching applications

## Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - loads plugins and core
├── lua/
│   ├── core/
│   │   ├── options.lua         # Vim options and settings
│   │   ├── keymaps.lua         # Basic keymaps
│   │   └── autocmds.lua        # Autocommands
│   ├── plugins/
│   │   ├── lsp.lua             # LSP configuration
│   │   ├── completion.lua      # Completion setup
│   │   ├── telescope.lua       # Fuzzy finder
│   │   ├── ui.lua              # UI plugins
│   │   ├── editor.lua          # Editor enhancements
│   │   ├── git.lua             # Git integration
│   │   ├── formatting.lua      # Code formatting
│   │   ├── linting.lua         # Linting
│   │   ├── debug.lua           # Debugging (DAP)
│   │   ├── navigation.lua      # File navigation
│   │   └── misc.lua            # Miscellaneous
│   └── custom/
│       └── autosave.lua        # Custom autosave
├── CLAUDE.md                   # AI assistant instructions
└── README.md                   # This file
```

## Requirements

### Required
- Neovim >= 0.10
- `git`
- `make`
- `unzip`
- C compiler (gcc/clang)
- `ripgrep` - for telescope grep
- `fd-find` - for telescope file finding

### Optional
- Nerd Font - for icons (set `vim.g.have_nerd_font = true` in init.lua)
- `npm` - for Prettier, TypeScript tools
- `go` - for delve debugger (if using DAP)
- Clipboard tool: xclip/xsel/win32yank (platform-dependent)

## Installation

1. **Backup existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this config:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

   Lazy.nvim will automatically install all plugins on first launch.

4. **Check health:**
   ```vim
   :checkhealth
   ```

## Customization

### Adding a Plugin

1. Choose or create a file in `lua/plugins/`
2. Add your plugin specification:
   ```lua
   return {
     {
       'author/plugin-name',
       opts = { ... },
     },
   }
   ```
3. Restart Neovim - plugins auto-install

### Adding an LSP Server

Edit `lua/plugins/lsp.lua`:
1. Add server name to `servers` table
2. Add to `ensure_installed` for auto-installation
3. Restart Neovim

### Adding a Formatter

Edit `lua/plugins/formatting.lua`:
1. Add to `formatters_by_ft` table
2. Configure formatter options if needed

### Disabling Features

In `init.lua`, comment out the import:
```lua
-- { import = 'plugins.debug' },  -- Disable debugging
```

## Useful Commands

```vim
:Lazy                    " Plugin manager
:Mason                   " LSP/tool installer
:LspInfo                 " LSP client status
:ConformInfo             " Formatter info
:checkhealth             " Health check
:Telescope keymaps       " Search all keybindings
```

## Leader Key

The leader key is `<space>`. Most custom keybindings start with `<leader>`.

## Learning Resources

- Run `:Tutor` for Neovim basics
- Use `:Telescope keymaps` to discover keybindings
- Press `<leader>` and wait to see available commands (via which-key)
- Check `:help` for any command or plugin

## Contributing

This is a personal configuration, but feel free to fork and adapt it to your needs. See `CLAUDE.md` for detailed architecture information.

## License

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - MIT License
