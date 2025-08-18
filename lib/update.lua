-- Delete uninstall.lua
if fs.exists("/silkroad/uninstall.lua") then
    print("Deleting uninstall.lua...")
    fs.delete("/silkroad/uninstall.lua")
else
    print("uninstall.lua not found, skipping...")
end

-- Delete dig.lua
if fs.exists("/silkroad/dig.lua") then
    print("Deleting dig.lua...")
    fs.delete("/silkroad/dig.lua")
else
    print("dig.lua not found, skipping...")
end

-- Delete dig_options.cfg
if fs.exists("/silkroad/dig_options.cfg") then
    print("Deleting dig_options.cfg...")
    fs.delete("/silkroad/dig_options.cfg")
else
    print("dig_options.cfg not found, skipping...")
end

-- Delete dig_fuel.cfg
if fs.exists("/silkroad/dig_fuel.cfg") then
    print("Deleting dig_fuel.cfg...")
    fs.delete("/silkroad/dig_fuel.cfg")
else
    print("dig_fuel.cfg not found, skipping...")
end

-- Delete dig_save.cfg
if fs.exists("/silkroad/dig_save.cfg") then
    print("Deleting dig_save.cfg...")
    fs.delete("/silkroad/dig_save.cfg")
else
    print("dig_save.cfg not found, skipping...")
end

-- Delete flex.lua
if fs.exists("/silkroad/flex.lua") then
    print("Deleting flex.lua...")
    fs.delete("/silkroad/flex.lua")
else
    print("flex.lua not found, skipping...")
end

-- Delete flex_options.cfg
if fs.exists("/silkroad/flex_options.cfg") then
    print("Deleting flex_options.cfg...")
    fs.delete("/silkroad/flex_options.cfg")
else
    print("flex_options.cfg not found, skipping...")
end

-- Delete quarry.lua
if fs.exists("/silkroad/quarry.lua") then
    print("Deleting quarry.lua...")
    fs.delete("/silkroad/quarry.lua")
else
    print("quarry.lua not found, skipping...")
end

-- Delete receive.lua
if fs.exists("/silkroad/receive.lua") then
    print("Deleting receive.lua...")
    fs.delete("/silkroad/receive.lua")
else
    print("receive.lua not found, skipping...")
end

-- Delete stairs.lua
if fs.exists("/silkroad/stairs.lua") then
    print("Deleting stairs.lua...")
    fs.delete("/silkroad/stairs.lua")
else
    print("stairs.lua not found, skipping...")
end

-- Delete log.txt
if fs.exists("/silkroad/log.txt") then
    print("Deleting log.txt...")
    fs.delete("/silkroad/log.txt")
else
    print("log.txt not found, skipping...")
end

-- Delete startup.lua
if fs.exists("/startup.lua") then
    print("Deleting startup.lua...")
    fs.delete("/startup.lua")
else
    print("startup.lua not found, skipping...")
end

-- Delete silkroad.lua
if fs.exists("/silkroad.lua") then
    print("Deleting silkroad.lua...")
    fs.delete("/silkroad.lua")
else
    print("silkroad.lua not found, skipping...")
end

-- Temporary script to delete this script after it finishes
local selfPath = "/silkroad/update.lua"
local temp = fs.open("/delete_self.lua", "w")
temp.write([[
sleep(0.5)
fs.delete("]] .. selfPath .. [[")
fs.delete("/delete_self.lua")

-- Download the latest version of silkroad.lua
shell.run("wget https://raw.githubusercontent.com/AriesLR/SilkroadMC/refs/heads/main/silkroad.lua /silkroad.lua")

-- Run the updated script
shell.run("/silkroad.lua")
]])
temp.close()

-- Run the temporary delete_self script
shell.run("/delete_self.lua")
print("Update complete!")