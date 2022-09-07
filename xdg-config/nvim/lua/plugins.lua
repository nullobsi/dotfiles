vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use { "ellisonleao/gruvbox.nvim" }

	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	use{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
	}

	use {
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip'
	}
	use {
		"luukvbaal/nnn.nvim",
	}
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'},
	}

	use { 'onsails/lspkind.nvim' }
--	use 'f-person/auto-dark-mode.nvim'
end)

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  overrides = {},
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "phpdoc" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


local cfg = {
	auto_open = {
--		setup = "explorer",       -- or "explorer" / "picker", auto open on setup function
		--empty = false,     -- only auto open on empty buffer
	},
	--auto_close = false,  -- close tabpage/nvim when nnn is last window
	--replace_netrw = nil, -- or "explorer" / "picker"
	windownav = {        -- window movement mappings to navigate out of nnn
		left = "<C-h>",
		right = "<C-l>",
		next = "<C-w>",
		prev = "<C-W>",
	},
	--buflisted = false,   -- whether or not nnn buffers show up in the bufferlist
	--quitcd = "tcd",      -- or "cd" / "lcd", command to run if quitcd file is found
}

require('nnn').setup(cfg)

--local auto_dark_mode = require('auto-dark-mode')

--[[auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme gruvbox')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme gruvbox')
	end,
})
auto_dark_mode.init()]]--

