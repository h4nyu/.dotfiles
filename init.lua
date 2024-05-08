vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"
vim.opt.number = true
vim.opt.title = true
vim.opt.guicursor=""
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = true
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
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
      vim.keymap.set(
        'n',
        '<leader>j',
        function(
        )
          require(
            'treesj'
          ).toggle(
            {
              split = {
                recursive = true,
              },
            }
          )
        end
      )
    end,
  },
  {
    'airblade/vim-rooter',
    config = function ()
      vim.g.rooter_patterns = { '.git', '.git/' }
    end
  },
  {
    'rstacruz/vim-closer',
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
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() 
      require('lualine').setup()
    end
  },
  {
    "junegunn/fzf",
  },
  {
    "junegunn/fzf.vim",
    config = function() 
      vim.g.fzf_layout = { down = "~60%" }
      vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":GitFiles<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>f", ":Files<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>c", ":Files<C-R>=expand('%:h')<CR><CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader><CR>", ":Ag<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>h", ":History<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>g", ":GFiles<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>b", ":Buffers<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>l", ":Lines<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>m", ":Marks<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>t", ":Tags<CR>", { noremap = true, silent = true })
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
      vim.api.nvim_set_keymap("x", "<Leader>k", ":Commentary<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>k", ":Commentary<CR>", { noremap = true, silent = true })
    end
  },
  {
    "peitalin/vim-jsx-typescript"
  },
  {
    "dhruvasagar/vim-table-mode"
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-omni",
    },
    config = function() 
      local cmp = require'cmp'
      local source_mapping = {
        copilot = "[Cop]",
        omni = "[Omn]",
        path = "[Pat]",
        buffer = "[Buf]",
      }
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        formatting = {
          format = function(entry, vim_item)
            local menu = source_mapping[entry.source.name]
            vim_item.menu = menu
            return vim_item
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp.mapping.confirm({ select = true }),
          ['<C-k>'] = cmp.mapping.confirm({ select = true }),
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
          { name = 'omni' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  }
})

