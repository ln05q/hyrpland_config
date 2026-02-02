return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.verible_verilog_format,
			},
		})

		vim.keymap.set("n", "<C-k>", vim.lsp.buf.format, {})
	end,
}
