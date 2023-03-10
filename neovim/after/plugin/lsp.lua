local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'cssls',
    'jsonls',
    'yamlls',
    'gopls'
})

local luasnip = require('luasnip')
local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = cmp.mapping(function()
    if (luasnip.jumpable(1)) then
        luasnip.jump(1)
        return
    end
    return nil
end, { 'i', 's' })

cmp_mappings['<S-Tab>'] = cmp.mapping(function()
    if (luasnip.jumpable(-1)) then
        luasnip.jump(-1)
        return
    end
    return nil
end, { 'i', 's' })

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local prettier = require('prettier')

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', '\'', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

    if client.supports_method("textDocument/formatting") then
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end
        })
    end

    vim.keymap.set('n', '<leader>f', function()
        prettier.format()
    end, opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            prettier.format()
        end
    })
end)

lsp.setup()
