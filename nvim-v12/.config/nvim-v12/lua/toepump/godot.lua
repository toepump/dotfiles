-- paths to check for project.godot file
local paths_to_check = { '/', '/../' }
local is_godot_project = false
local godot_project_path = ''
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for _, value in pairs(paths_to_check) do
    if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
        print 'Godot Project Detected!'
        is_godot_project = true
        godot_project_path = cwd .. value
        break
    end
end

if is_godot_project then
    -- check if server is already running in godot project path
    local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
    print('is godot server running: ' .. tostring(is_server_running ~= nil))
    -- start server, if not already running
    if not is_server_running then
        print 'Server not running...Starting server pipe. Please ensure that Godot is running.'
        vim.fn.serverstart(godot_project_path .. '/server.pipe')
    end
end
