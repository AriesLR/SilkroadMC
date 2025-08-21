local digUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/dig.lua"
local flexUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/flex.lua"
local quarryUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/quarry.lua"
local receiveUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/receive.lua"
local stairsUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/stairs.lua"
local uninstallUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/uninstall.lua"
local updateUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/update.lua"
local targetDir = "/sr"

-- Ensure the directory exists
if not fs.exists(targetDir) then
    print("Creating directory " .. targetDir)
    fs.makeDir(targetDir)
end

-- Download from raw URL
local function downloadFile(url, dir)
    local fileName = url:match(".+/([^/]+)$")
    local fullPath = dir .. "/" .. fileName

    print("Downloading " .. fileName .. " to " .. dir .. "...")
    local res = http.get(url)
    if res then
        local f = fs.open(fullPath, "w")
        f.write(res.readAll())
        f.close()
        res.close()
        print(fileName .. " downloaded successfully.")
    else
        print("Failed to download " .. fileName)
    end

    return fullPath
end

-- Download dig.lua
downloadFile(digUrl, targetDir)

-- Download flex.lua
downloadFile(flexUrl, targetDir)

-- Download quarry.lua
downloadFile(quarryUrl, targetDir)

-- Download receive.lua
downloadFile(receiveUrl, targetDir)

-- Download stairs.lua
downloadFile(stairsUrl, targetDir)

-- Download uninstall.lua
downloadFile(uninstallUrl, targetDir)

-- Download update.lua
downloadFile(updateUrl, targetDir)

print("All files downloaded successfully to " .. targetDir)
sleep(1)
print("Navigating to " .. targetDir)
sleep(1)
term.clear()
term.setCursorPos(1, 1)
shell.run("cd " .. targetDir)
shell.run("ls")

