-- ~/.config/nvim/lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation [citation:8]
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows using arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Stay in visual mode when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts) 
map("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<leader>fv", function()
  local out = vim.fn.expand("%:p:r") .. ".pdf"
  vim.fn.jobstart({ "zathura", out })
end, { buffer = true, desc = "Fountain: Preview in Zathura" })
