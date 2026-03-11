return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ":TSUpdate",
  opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",         -- React/JSX
        "html",
        "css",
        "json",
        "jsonc",       -- JSON with comments (tsconfig etc)
        "graphql",     -- if you use it
        "prisma",      -- if you use it
      },
  },
  config = function()
    require'nvim-treesitter'.setup {
        install_dir = vim.fn.stdpath('data') .. '/site'
    }
    require'nvim-treesitter'.install { 'rust', 'swift', 'javascript', 'zsh', 'bash' }
  end,
}
