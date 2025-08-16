-- Delete the /silkroad folder and everything inside it
if fs.exists("/silkroad") then
    print("Deleting /silkroad folder and its contents...")
    fs.delete("/silkroad")
else
    print("/silkroad folder not found, skipping...")
end

-- Delete startup.lua
if fs.exists("/startup.lua") then
    print("Deleting startup.lua...")
    fs.delete("/startup.lua")
else
    print("startup.lua not found, skipping...")
end

-- Delete spoticraft.lua
if fs.exists("/silkroad.lua") then
    print("Deleting silkroad.lua...")
    fs.delete("/silkroad.lua")
else
    print("silkroad.lua not found, skipping...")
end

-- Temporary script to delete this script after it finishes
local selfPath = "/silkroad/uninstall.lua"
local temp = fs.open("/delete_self.lua", "w")
temp.write([[
sleep(0.5)
fs.delete("]] .. selfPath .. [[")
fs.delete("/delete_self.lua")
]])
temp.close()

-- Run the temporary delete_self script
shell.run("/delete_self.lua")
print("Uninstall complete!")
