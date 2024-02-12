-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set=vim.opt
local opt=vim.opt

set.nu=true
set.shiftwidth=4
set.tabstop=4
set.cindent=true
set.expandtab=true
set.smartindent=true
set.autoindent=true
set.colorcolumn="80"
set.showmatch=true
set.showmode=true
set.uc=0
set.hlsearch=true
set.list=true
set.listchars='eol:⏎,tab:| ,trail:·,extends:…,precedes:…,space:·'
set.syntax=on

vim.cmd('autocmd FileType gitcommit setlocal tw=72')
vim.cmd('autocmd FileType json set formatprg=jq')

-- Enable global clipboard
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- Lazy Nvim
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


-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- Keymaps
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', "<C-p>", '<Cmd>Telescope find_files<CR>') 

-- Plugins
require("lazy").setup("plugins")

-- Language Server Protocol
require("lsp-format").setup {}

local cmp = require("cmp")
cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--enable-config", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})

-- Theme
vim.opt.termguicolors = true
vim.cmd('colorscheme catppuccin')

-- Lualine
require('lualine').setup(
{
    options = {
        section_separators = {'', ''},
        component_separators = {'', ''},
        icons_enabled = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
})

vim.opt.mouse = 'a'

-- Telescope
require('telescope').setup{
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    }
}
--vim.keymap.set('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>fc', '<Cmd>Telescope commands<CR>')

-- Bufferline
require('bufferline').setup{}

-- Git signs
require('gitsigns').setup()

-- Leap
require('leap').create_default_mappings()

-- Diffview
require('diffview').setup{}

