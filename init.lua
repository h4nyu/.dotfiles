vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"
vim.opt.number = true
vim.opt.title = true
vim.opt.guicursor=""
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.g.mapleader = " "

vim.cmd([[
augroup fileTypeIndent
autocmd!
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.lua setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.mjs setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.mjsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vue syntax sync fromstart
autocmd FileType nginx setl sw=2 sts=2 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType java setlocal ts=2 sts=2 sw=2 expandtab
augroup END
]])
vim.cmd([[filetype plugin indent on]])


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({})
    end
  },
  {
    "nat-418/boole.nvim",
    config = function()
      require("boole").setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
        additions = {
          {'Todo', 'Waiting', 'Done', "InProgres"}
        },
      })
    end
  },
  {
    "shellRaining/hlchunk.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require("hlchunk").setup({
        indent = { enable = false },
        blank = { enable = false },
        chunk = {
          style = "#00ffff",
        },
      })
    end,

  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
      vim.keymap.set('n', '<leader>j', function() require('treesj').toggle({ split = { recursive = true } }) end)
    end,
  },
  {
    'airblade/vim-rooter',
    config = function ()
      vim.g.rooter_patterns = { '.git', '.git/' }
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "airblade/vim-gitgutter",
  },
  {
    'easymotion/vim-easymotion',
    config = function ()
      vim.g.EasyMotion_do_mapping = 0
      vim.g.EasyMotion_smartcase = 1
      vim.g.EasyMotion_use_smartsign_us = 1
      vim.api.nvim_set_keymap("n", "L", "<Plug>(easymotion-overwin-line)", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "w", "<Plug>(easymotion-overwin-w)", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", { noremap = true, silent = true })
    end
  },
  {
    'zbirenbaum/copilot.lua',
    config = function ()
      require("copilot").setup({})
    end
  },
  {
    'rhysd/clever-f.vim',
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  'christoomey/vim-tmux-navigator',
  {
    'w0ng/vim-hybrid',
    config = function() 
      vim.cmd("colorscheme hybrid")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() 
      require('lualine').setup({
        options = {
          icons_enabled = false,
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '', right = ''},
        },
        sections = {lualine_c = {require('auto-session.lib').current_session_name}}
      })
    end
  },
  {
    "junegunn/fzf",
  },
  {
    "junegunn/fzf.vim",
    config = function() 
      vim.g.fzf_layout = { down = "~60%" }
      vim.api.nvim_set_keymap("n", "<Leader>f", ":Files<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>k", ":Files<C-R>=expand('%:h')<CR><CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader><CR>", ":Ag<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>h", ":History<CR>", { noremap = false, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>g", ":GFiles<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>b", ":Buffers<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>l", ":Lines<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>m", ":Marks<CR>", { noremap = true, silent = true })
    end
  }, 
  {
    "tpope/vim-fugitive",
    config = function() 
      vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>gp", ":Git push<CR>", { noremap = true, silent = true })
    end
  },
  {
    'tpope/vim-commentary',
    config = function() 
      vim.api.nvim_set_keymap("x", "<Leader>c", ":Commentary<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>c", ":Commentary<CR>", { noremap = true, silent = true })
    end
  },
  {
    "peitalin/vim-jsx-typescript"
  },
  {
    "dhruvasagar/vim-table-mode"
  },
  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-omni",
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    },
    config = function() 
      local cmp = require'cmp'
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local source_mapping = {
        buffer = "[Buffer]",
        copilot = "[Copilot]",
        omni = "[Omni]",
        cmp_tabnine = "[TN]",
        path = "[Path]",
      }

      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
              local detail = (entry.completion_item.labelDetails or {}).detail
              vim_item.kind = ""
              if detail and detail:find('.*%%.*') then
                vim_item.kind = vim_item.kind .. ' ' .. detail
              end

              if (entry.completion_item.data or {}).multiline then
                vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
              end
            end
            local maxwidth = 80
            vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp.mapping.confirm({ select = true }),
          ['<C-k>'] = cmp.mapping.confirm(),
          ['<C-e>'] = cmp.mapping.abort(), 
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'copilot' },
          { name = 'cmp_tabnine' },
          { name = 'path' },
          { name = 'omni' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  }
})

