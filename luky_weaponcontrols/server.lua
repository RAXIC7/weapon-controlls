local scriptVersion = "1.0"
local githubLink = "https://github.com/LukyNo1/weapon-controlls"

function checkVersion()
    PerformHttpRequest(githubLink .. "/releases/latest", function(err, text, headers)
        if err == 200 then
            local latestVersion = string.match(text, 'tag/v(%d+.%d+)')
            if latestVersion and latestVersion ~= scriptVersion then
                print("^1New Version of the script is released " .. githubLink)
            end
        end
    end, "GET", "", {["Content-Type"] = "application/json"})
end

Citizen.CreateThread(function()
    checkVersion()
end)

Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "luky_weaponcontrols" then
      print("-----------------------------------------------------")
      print("Please Dont Change the resource name to avoid bugs and errors.")
	    print("Script made by LukyNo")
      print("-----------------------------------------------------")
    end
end)
