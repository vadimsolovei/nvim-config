-- Navigation plugins: Harpoon, Neo-tree
return {
  {
    -- Harpoon - Quick file navigation
    'ThePrimeagen/harpoon',
    branch = 'harpoon2', -- Use the 'harpoon2' branch for the latest version
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Harpoon depends on plenary
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup {}

      -- Basic Harpoon Keymaps
      -- See :help harpoon-keymaps and :help harpoon.mark
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add file to Harpoon list' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle Harpoon Quick Menu' })

      -- Jump to specific files in the list
      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end, { desc = 'Go to Harpoon file 1' })
      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(2)
      end, { desc = 'Go to Harpoon file 2' })
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():select(3)
      end, { desc = 'Go to Harpoon file 3' })
      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(4)
      end, { desc = 'Go to Harpoon file 4' })
      -- You can add more as needed, up to 9 or 10 if you want.
    end,
  },

  {
    -- Snacks.nvim - Required for neo-tree image previews
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      -- Enable only features we need for neo-tree
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      image = { enabled = true }, -- For neo-tree image previews
      input = { enabled = false },
      lazygit = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = true },
      words = { enabled = false },
    },
  },

  {
    -- Neo-tree is a Neovim plugin to browse the file system
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      'folke/snacks.nvim', -- Optional, for image previews
    },
    lazy = false,
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },
}
