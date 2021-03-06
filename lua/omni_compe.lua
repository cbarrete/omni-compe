local M = {}

function M.setup(filetypes)
    vim.cmd [[ echohl ErrorMsg | echom 'omni-compe is now deprecated and part of nvim-compe' ]]
    local compe = require('compe')

    local Source = {}

    function Source.get_metadata()
        local metadata = {
            menu = '[Omni]',
            priority = 100,
        }
        if filetypes then
            metadata.filetypes = filetypes
        end
        return metadata
    end

    function Source.determine(_, context)
        return compe.helper.determine(context)
    end

    function Source.complete(self, context)
        vim.api.nvim_call_function(vim.bo.omnifunc, { 1, '' })
        context.callback({ items = vim.api.nvim_call_function(vim.bo.omnifunc, { 0, context.input }) })
    end

    compe.register_source('omni', Source)
end

return M
