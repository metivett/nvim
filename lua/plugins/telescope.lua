return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys =
    {
        {'<leader>t', "<cmd>Telescope find_files<cr>", desc = "Find file"},
        {'<leader>p', "<cmd>Telescope find_files<cr>", desc = "Find file in current file directory"},
        {'<leader>b', "<cmd>Telescope buffers<cr>", desc = "Find buffer"},
        {'<leader>gg', "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
        {'<leader>gw', "<cmd>Telescope grep_string<cr>", desc = "Grep string under cursor"}
    },
}
