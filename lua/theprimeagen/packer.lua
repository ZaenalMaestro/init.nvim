vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- theme
    use({
        'projekt0n/github-nvim-theme', tag = 'v0.0.7',
        -- or                            branch = '0.0.x'
        config = function()
            require('github-theme').setup({
                 theme_style = "dark_default",
                function_style = "italic",
                sidebars = {"qf", "vista_kind", "terminal", "packer"},

                -- Change the "hint" color to the "orange" color, and make the "error" color bright red
                colors = {hint = "orange", error = "#ff0000"},

                -- Overwrite the highlight groups
                overrides = function(c)
                    return {
                        htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
                        DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
                        -- this will remove the highlight groups
                        TSField = {},
                    }
                end
            })
        end
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('theprimeagen/harpoon')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    use 'mattn/emmet-vim'
    use 'AndrewRadev/tagalong.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'preservim/nerdcommenter'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'nvim-tree/nvim-web-devicons'
    use {'mhinz/vim-signify', { tag = 'legacy' }}
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
end)
