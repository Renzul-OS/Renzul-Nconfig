return{
    {"franco-ruggeri/pdf-preview.nvim",opts = {},
        -- Override defaults here
    lazy=true,
    config = function(_, opts)
    require("pdf-preview").setup(opts)
    --Keymaps before end
--:pdfPrevieStart(Stop/toggle), open printed url in browser
    end,}
}
