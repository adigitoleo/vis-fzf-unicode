local module = {}
module.fzf_bin = "fzf"
module.fzf_args = ""

function get_script_dir()
    local relativepath = debug.getinfo(1, "S").source:sub(2)
    local dir, file = relativepath:match('^(.*/)([^/]-)$')
    if dir == nil and file == nil then
        return "./"
    else
        return dir
    end
end

module.latex_symbols = get_script_dir() .. "latex_symbols.txt"
assert(io.open(module.latex_symbols))


vis:command_register("fzf-unicode", function(argv, force, win, selection, range)
    local command = module.fzf_bin .. " " .. module.fzf_args .. " < " .. module.latex_symbols
    local fzf_out = io.popen(command)
    local output = {}
    for line in fzf_out:lines() do
        table.insert(output, line)
    end
    local success, msg, status = fzf_out:close()

    if status == 0 then
        vis:feedkeys(
            string.format(
                "<vis-append-char-next>%s", string.match(output[1], "([^%s]+)$")
            )
        )
    elseif status == 2 then
        vis:info(
            string.format(
                "fzf-unicode: Error. Command %s exited with return value %i",
                command, status
            )
        )
    elseif status == 130 then
        vis:info(
            string.format(
                "fzf-unicode: Interrupted. Command %s exited with return value %i",
                command, status
            )
        )
    else
        vis:info(
            string.format(
                "fzf-unicode: Unknown exit status %i. Command %s exited with return value %i",
                status, command, status
            )
        )
    end

    vis:redraw()

    return true;
end, "Search and insert unicode character")

return module
