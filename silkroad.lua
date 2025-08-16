local digUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/dig.lua"
local flexUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/flex.lua"
local quarryUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/quarry.lua"
local recieveUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/recieve.lua"
local stairsUrl = "https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/lib/stairs.lua"
local targetDir = "/silkroad"

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

-- Download recieve.lua
downloadFile(recieveUrl, targetDir)

-- Download stairs.lua
downloadFile(stairsUrl, targetDir)

print("All files downloaded successfully to " .. targetDir)
sleep(1)
print("Navigating to " .. targetDir)
sleep(2)
term.clear()
term.setCursorPos(1, 1)
shell.run("cd " .. targetDir)
shell.run("ls")

