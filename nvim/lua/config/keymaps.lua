local discipline = require("craftzdog.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

keymap.set("n", "<s><s>", ";f")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Typr Typing Practice
keymap.set("n", "ty", "<cmd>Typr<CR>")
keymap.set("n", "tys", "<cmd>TyprStats<CR>")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Flutter keymaps
keymap.set("n", "flsp", "<cmd>FlutterLspRestart<CR>")
keymap.set("n", "fpg", "<cmd>FlutterPubGet<CR>")
keymap.set("n", "femu", "<cmd>FlutterEmulators<CR>")
keymap.set("n", "fdev", "<cmd>FlutterDevices<CR>")
keymap.set("n", "flc", "<cmd>FlutterLogClear<CR>")
keymap.set("n", "flt", "<cmd>FlutterLogToggle<CR>")
keymap.set("n", "frun", "<cmd>FlutterRun<CR>")
keymap.set("n", "frel", "<cmd>FlutterReload<CR>")
keymap.set("n", "fres", "<cmd>FlutterRestart<CR>")
