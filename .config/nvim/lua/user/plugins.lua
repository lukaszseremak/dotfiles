local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("kazhala/close-buffers.nvim")
	use({ "akinsho/toggleterm.nvim", tag = "v1.*" })
	use("nvim-lualine/lualine.nvim")
	use("SmiteshP/nvim-gps")
	use("folke/which-key.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("startup-nvim/startup.nvim")
	use("lambdalisue/suda.vim")
	use({
		"jghauser/mkdir.nvim",
		config = function()
			require("mkdir")
		end,
	})
	use({
		"gelguy/wilder.nvim",
		run = ":UpdateRemotePlugins",
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
		ft = "markdown",
	})
	use("norcalli/nvim-colorizer.lua")
	use("danymat/neogen")
	use("folke/todo-comments.nvim")
	use("mechatroner/rainbow_csv")
	use("ggandor/lightspeed.nvim")
	use("rcarriga/nvim-notify")
	use("https://gitlab.com/yorickpeterse/nvim-window.git")
	use("johmsalas/text-case.nvim")
	use("petertriho/nvim-scrollbar")
	use("kylechui/nvim-surround")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("saadparwaiz1/cmp_luasnip")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use("tamago324/nlsp-settings.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("LinArcX/telescope-env.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("romgrk/nvim-treesitter-context")

	-- Git
	use("lewis6991/gitsigns.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
