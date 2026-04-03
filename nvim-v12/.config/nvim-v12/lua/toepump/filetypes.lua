-- This file defines any filetypes that aren't automatically correctly identified by neovim
-- ex. gdshader files were correctly identified as gdshader, but I'm using glsl-analyzer for lsp.
-- So I need to tell neovim that gdshader files should be identified as glsl filetypes so that the lsp works
vim.filetype.add {
    extension = {
        gdshader = 'glsl',
        save = 'json',
    },
}
