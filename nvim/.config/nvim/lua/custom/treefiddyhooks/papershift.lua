local Job = require("plenary.job")

local M = {}

function M.run_hook(action, data)
    local run_script = false
    local script_dir = os.getenv("HOME") .. "/.dotfiles/scripts/treefiddy/papershift/"
    local script_path = nil

    if action == "create.post-move" or action == "checkout.post-move" then
        script_path = script_dir .. "post_create_worktree.sh"
        run_script = true
    elseif action == "post-move" then
        script_path = script_dir .. "post_move_to_worktree.sh"
        run_script = true
    end

    if run_script then
        print("Running " .. script_path .. " - This could take a while...")

        local err_message = ""

        Job:new({
            command = "bash",
            args = {
                script_path,
                "-b",
                data.current_branch,
                "-p",
                data.current_path,
                "-n",
                data.abs_path,
            },
            on_stderr = function(_, err_data)
                err_message = err_message .. "\n" .. err_data
            end,
            on_exit = function(_, return_val)
                if return_val == 0 then
                    print("Successfully ran " .. script_path)
                    return
                end

                print(
                    "Error running `bash "
                        .. script_path
                        .. " -b "
                        .. data.current_branch
                        .. " -p "
                        .. data.current_path
                        .. " -n "
                        .. data.abs_path
                        .. "` "
                        .. err_message
                )
            end,
        }):start()
    end
end

return M
