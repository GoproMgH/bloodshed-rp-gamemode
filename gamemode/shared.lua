
GM.Name 	= "BloodshedRP"
GM.Author 	= "Blazedd & Zezoog"
GM.Email 	= "N/A"
GM.Website 	= "http://code.google.com/p/bloodshed-rp-gamemode/"

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
end

function GM:PlayerConnect( name, address ) 
    print( "Player " .. name .. " has joined the game ")
end 