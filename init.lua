
minetest.register_on_prejoinplayer(function(name, ip)
	if name == "singleplayer" or name == admin then
		return
	
	else
		local count = 0
		for char = 1, #name do
			local c = name:sub(char,char)
			if tonumber(c) then
				count = count + 1

			end -- if tonumber

		end -- for char

		if count > 2 then
			return "No Names with more than 2 Numbers in it."
			
		end -- if count
	
	end -- if name
	
end)