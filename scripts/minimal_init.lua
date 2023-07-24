vim.opt.runtimepath:append('.')
vim.cmd.runtime({ 'plugin/plenary.vim', bang = true })
vim.cmd.runtime({ 'plugin/nvim-treesitter.lua', bang = true })
vim.cmd.runtime({ 'plugin/query_predicates.lua', bang = true })
vim.cmd.runtime({ 'plugin/filetypes.lua', bang = true })

vim.filetype.add({
  extension = {
    conf = 'hocon',
    hurl = 'hurl',
    ncl = 'nickel',
    tig = 'tiger',
    usd = 'usd',
    usda = 'usd',
    wgsl = 'wgsl',
    w = 'wing',
  },
})

vim.o.swapfile = false
vim.bo.swapfile = false

require('nvim-treesitter').setup()
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start)
    vim.bo[args.buf].indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
  end,
})
--
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.t32 = {
--   install_info = {
--     -- url = "/home/christoph/workspace/tree-sitter-t32", -- local path or git repo
--     url = "https://codeberg.org/xasc/tree-sitter-t32", -- local path or git repo
--     files = { "src/parser.c", "src/scanner.c" },
--     -- optional entries:
--     branch = "main", -- default branch in case of git repo if different from master
--     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--   },
--   filetype = "t32", -- if filetype does not match the parser name
-- }
