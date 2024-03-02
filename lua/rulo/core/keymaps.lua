vim.g.mapleader = ","
local keymap = vim.keymap

keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>gf", ":NvimTreeFindFile<CR>")

keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprevious<CR>")
keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gh", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]

-- fugitive commands
-- keymap.set("n", "<leader>gitb", ":G blame<cr>")
-- keymap.set("n", "<leader>gitm", ":G mergetool<cr>")
-- conflict handing
keymap.set("n", "<leader>mc", ":Gdiffsplit!<cr>")
keymap.set("n", "<leader>ml", ":diffget //2<cr>")
keymap.set("n", "<leader>mr", ":diffget //3<cr>")

-- Vgit commands
-- keymap.set("n", "<leader>gitd", ":VGit buffer_history_preview<cr>")
keymap.set("n", "<leader>gits", "<cmd>Telescope git_status<cr>")
keymap.set("n", "<leader>gst", "<cmd>Telescope git_stash<cr>")
-- keymap.set("n", "<leader>gh", ":VGit buffer_history_preview<cr>")
