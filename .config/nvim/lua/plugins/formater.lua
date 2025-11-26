require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black", lsp_format = "fallback" },
		rust = { "rustfmt", lsp_format = "fallback" },
		go = { "goimports", "gofmt", lsp_format = "fallback" },
		javascript = { "prettierd" }, --
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		html = { "prettierd" },
		markdown = { "prettierd" },
		yaml = { "yamlls", lsp_format = "fallback" },
		hcl = { "packer_fmt" },
		terraform = { "terraform_fmt" },
		tf = { "terraform_fmt" },
		["terraform-vars"] = { "terraform_fmt" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Formatter: [f]ormat" })
