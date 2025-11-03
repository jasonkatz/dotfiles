-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- Telescope relies on an installation of the ripgrep CLI tool to work 100% properly

    use {
        'tanvirtin/monokai.nvim',
        config = function()
            require('monokai').setup {}
            --require('monokai').setup { palette = require('monokai').pro }

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'

    use 'mbbill/undotree'

    -- LSP Support
    use { 'neovim/nvim-lspconfig' }             -- Required
    use { 'williamboman/mason.nvim' }           -- Optional
    use { 'williamboman/mason-lspconfig.nvim' } -- Optional

    -- Autocompletion
    use { 'hrsh7th/nvim-cmp' }         -- Required
    use { 'hrsh7th/cmp-nvim-lsp' }     -- Required
    use { 'hrsh7th/cmp-buffer' }       -- Optional
    use { 'hrsh7th/cmp-path' }         -- Optional
    use { 'saadparwaiz1/cmp_luasnip' } -- Optional
    use { 'hrsh7th/cmp-nvim-lua' }     -- Optional

    -- Snippets
    use { 'L3MON4D3/LuaSnip' }             -- Required
    use { 'rafamadriz/friendly-snippets' } -- Optional

    -- Prettier
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'MunifTanjim/prettier.nvim' }

    use 'github/copilot.vim'
end)
