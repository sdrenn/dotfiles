local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup(
	{
		"rebelot/kanagawa.nvim",
		"BurntSushi/ripgrep",
		"sharkdp/fd",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
        "hrsh7th/vim-vsnip",
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/tree-sitter-lua",
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
        "preservim/nerdtree",
        "vimwiki/vimwiki",
		{
		    'wthollingsworth/pomodoro.nvim',
		    requires = 'MunifTanjim/nui.nvim',
		    config = function()
			require('pomodoro').setup({
			    time_work = 25,
			    time_break_short = 5,
			    time_break_long = 20,
			    timers_to_long_break = 4
			})
		    end
		},
		{
		    'numToStr/Comment.nvim',
		    opts = {
			-- add any options here
		    },
		    lazy = false,
		},
		{'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
		{
		  "zk-org/zk-nvim",
		  config = function()
		    require("zk").setup({
		      -- See Setup section below
		    })
		  end
		},
		"eandrju/cellular-automaton.nvim",
		"hoob3rt/lualine.nvim",
	}
)

vim.cmd.colorscheme('kanagawa')
require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').marksman.setup{}
require("zk").setup({
  -- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope", "fzf" or "fzf_lua"
  picker = "telescope",

  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
      -- on_attach = ...
      -- etc, see `:h vim.lsp.start_client()`
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  },
})
require('lualine').setup({
    sections = {
        lualine_c = { 'filename', require('pomodoro').statusline }
    }
})
