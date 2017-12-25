login_blacklist = {}

local check_login = {
	namefilter = {},
	modpath = minetest.get_modpath(minetest.get_current_modname())
}

dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/blacklist.lua")   -- avoid servercrash loop if someone decided to rename the modfolder !

function check_login.check_name(name)
	if (name == "") or (name == nil) then
		return false

	end -- if name


	local valid = true

	for key, value in ipairs(check_login.namefilter) do
		if string.find(string.lower(name), string.lower(value)) ~= nil then
			valid = false
		end -- if string.find

	end -- for key,value

	return valid -- Name was in Filter?

end

function check_login.get_numbers(name)

	local count = 0
		for char = 1, #name do
			local c = name:sub(char,char)
			if tonumber(c) then
				count = count + 1

			end -- if tonumber

		end -- for char

	 return count
	 
end -- check_numbers()

minetest.register_on_prejoinplayer(function(name, ip)
	if name == "singleplayer" or name == admin then
		return
	
	else
		-- Check if Name has more than 2 Numbers in it
		if( check_login.get_numbers(name) > 2) then
			return "No Names with more than 2 Numbers in it."

		end -- if check_numbers
		
		if( not (check_login.check_name(name))) then
			return "Your Username is on the Blacklist of the Server."
			
		end -- if check_name
		
	end -- if name
	
end)

--[[
	********************************************
	***           Start of the Mod                     ***
	********************************************
--]]

check_login.namefilter = login_blacklist
