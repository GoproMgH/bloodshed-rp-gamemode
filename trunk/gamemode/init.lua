
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )


// Serverside only stuff goes here

/*---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
---------------------------------------------------------*/
function GM:PlayerLoadout( ply )

	ply:StripWeapons()
	ply:Give( "empty_weapon" )
	
end

function GM:ShowHelp( ply ) -- This hook is called everytime F1 is pressed.
    umsg.Start( "HelpMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

function GM:ShowTeam( ply ) -- This hook is called everytime F2 is pressed.
    umsg.Start( "TeamMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

function GM:ShowSpare1( ply ) -- This hook is called everytime F3 is pressed.
    umsg.Start( "SpareaMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

function GM:ShowSpare2( ply ) -- This hook is called everytime F4 is pressed.
    umsg.Start( "SparebMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function