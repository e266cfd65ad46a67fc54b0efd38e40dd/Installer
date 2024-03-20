local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

if shared == nil then
	getgenv().shared = {} 
end

if isfile('vape/MainScript.lua') then 
	loadfile('vape/MainScript.lua')()
else 
	local mainscript = game:HttpGet('https://raw.githubusercontent.com/e266cfd65ad46a67fc54b0efd38e40dd/Installer/main/MainScript.lua') 
	task.spawn(function() loadstring(mainscript)() end)
	writefile('vape/MainScript.lua', mainscript)
end
