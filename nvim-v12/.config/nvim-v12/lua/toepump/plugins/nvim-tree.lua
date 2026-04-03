return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- Optional, for file icons
    },
    config = function()
        require('nvim-tree').setup {
            -- Custom configurations go here
            -- e.g., auto_close = true, diagnostics = { enable = true },
            filters = {
                custom = { '*.uid', '*.import' },
            },
            update_focused_file = {
                enable = true,
            },
            view = {
                width = 40,
            },
        }
    end,
}
