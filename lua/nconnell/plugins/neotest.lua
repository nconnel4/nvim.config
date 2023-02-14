local status, neotest = pcall(require, "neotest")
if not status then
	return
end

neotest.setup({
	adapters = {
		require("neotest-python")({
			runner = "pytest",
		}),
		require("neotest-plenary"),
		require("neotest-vitest"),
	},
})

vim.api.nvim_create_user_command("Neotest", function()
	neotest.run.run(vim.fn.getcwd())
end, {})

vim.api.nvim_create_user_command("NeotestSummary", function()
	neotest.summary.toggle()
end, {})

vim.api.nvim_create_user_command("NeotestOutput", function()
	neotest.output_panel.toggle()
end, {})
