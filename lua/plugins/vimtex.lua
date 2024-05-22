return {
    'lervag/vimtex',
    config = function()
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_quickfix_ignore_filters = {
            'Underfull',
            'Overfull',
        }
    end
}
