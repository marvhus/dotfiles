-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'
    use "andweeb/presence.nvim"
    use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/nvim-cmp"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use "nvim-lua/plenary.nvim"
    use "L3MON4D3/LuaSnip"
    use "lewis6991/gitsigns.nvim"
    use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-file-browser.nvim"
	use "nvim-treesitter/nvim-treesitter"
    use "simrat39/rust-tools.nvim"
    use "tpope/vim-commentary"
    use "windwp/nvim-autopairs"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
end)
