return {
    "nvim-treesitter/nvim-treesitter",
    
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }, 
        opts = {
            ensure_installed = { "rg", "fd" }
        }
    },

--  { "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }},
    
    'hrsh7th/cmp-nvim-lsp',
    
    'hrsh7th/nvim-cmp',
    
    'nvim-tree/nvim-web-devicons',
    
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                     show_hidden_count = true,
                     hide_dotfiles = false,
                     hide_gitignored = true,
                     hide_by_name = {
                       -- '.git',
                       -- '.DS_Store',
                       -- 'thumbs.db',
                     },
                    never_show = {},
                },
            }
        },
    },
    
    'nvim-lualine/lualine.nvim',
    
    --{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    
    "folke/trouble.nvim",
    
    "catppuccin/nvim",
    
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    
    "github/copilot.vim",
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "clangd", "cmake", "clang-format" }
        },
    },
    
    { 
        "neovim/nvim-lspconfig",
    },

    {
        "lukas-reineke/lsp-format.nvim"
    },
    
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    
    { 
        'mg979/vim-visual-multi', -- multiple cursors
    },

    {
        "akinsho/bufferline.nvim",
    version = "*",
        requires = "kyazdani42/nvim-web-devicons",
    },

    {
        "lewis6991/gitsigns.nvim",
    },

    {
        "sindrets/diffview.nvim",
    },

    {
        "ggandor/leap.nvim"
    },
}
