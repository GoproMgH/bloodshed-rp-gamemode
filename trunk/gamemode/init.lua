
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

AddCSLuaFile("/gui/menus/f1_menu.lua")
AddCSLuaFile("/gui/menus/f2_menu.lua")
AddCSLuaFile("/gui/menus/f3_menu.lua")
AddCSLuaFile("/gui/menus/f4_menu.lua")
AddCSLuaFile("/gui/menus/joinmenu.lua")

include( 'shared.lua' )

// Serverside stuff

/*---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
---------------------------------------------------------*/
function GM:PlayerLoadout( ply )

	ply:StripWeapons()
	ply:Give( "empty_weapon" )
end

/*---------------------------------------
Menus
---------------------------------------*/

//------------------------------F1 Menu--------------------------------------

function GM:ShowHelp( ply ) -- This hook is called everytime F1 is pressed.
    umsg.Start( "HelpMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

//------------------------------F2 Menu--------------------------------------

function GM:ShowTeam( ply ) -- This hook is called everytime F2 is pressed.
    umsg.Start( "TeamMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

//------------------------------F3 Menu--------------------------------------

function GM:ShowSpare1( ply ) -- This hook is called everytime F3 is pressed.
    umsg.Start( "SpareaMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

//------------------------------F4 Menu--------------------------------------

function GM:ShowSpare2( ply ) -- This hook is called everytime F4 is pressed.
    umsg.Start( "SparebMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

//---------------------------Spawn Menu--------------------------------------

function GM:PlayerInitialSpawn( pl )
    umsg.Start( "SpawnMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function

/*------------------------------
Realism/damage mechanics Section
------------------------------*/

//-------------Hit Location Compensation-------------------------------------

function ScaleDamage( ply, hitgroup, dmginfo )
 
    
     if ( hitgroup == HITGROUP_HEAD ) then
 
        dmginfo:ScaleDamage( 2 ) --Normal + 25% more pwnage
 
     end
 
    
    if ( hitgroup == HITGROUP_LEFTARM ||
         hitgroup == HITGROUP_RIGHTARM || 
         hitgroup == HITGROUP_LEFTLEG ||
         hitgroup == HITGROUP_RIGHTLEG ||
         hitgroup == HITGROUP_GEAR ) then
 
        dmginfo:ScaleDamage( 0.50 ) -- only half on legs/arms
 
     end
 
end
 
hook.Add("ScalePlayerDamage","ScaleDamage",ScaleDamage)

//-------------Ear ringing effect when shit explodes-------------------------

function GM:OnDamagedByExplosion( ply, dmginfo )
 
        ply:SetDSP( 35, false )
 
end

/*------------------------------
Basic Serverside Game Mechanics
------------------------------*/

//-------------OOC Chat------------------------------------------------------

function ISaid( ply, text, public )
    if (string.sub(text, 1, 4) == "/ooc") then--if the first 4 letters are /ooc continue
        return "[OOC]"..string.sub( text, 5 );--add [OOC] infront of the players text then display
    end
end
hook.Add( "PlayerSay", "ISaid", ISaid );

//--------------Welcome a player--------------------------------------------------------

function FirstSpawn( ply )
 
    ply:PrintMessage(HUD_PRINTCENTER,"Welcome to the server!")
 
end
 
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )

//----------------------------------------------------------------------

function fPlayerDisconnect( ply )
    // Print to chat that a player has disconnected from the server.
    PrintMessage( HUD_PRINTTALK, ply:GetName() .. " has left the server." )
end
// Add PlayerDisconnected hook that calls our function.
hook.Add( "PlayerDisconnected", "playerdisconnected", fPlayerDisconnect )

//---------------------------------------------------------------------


function GM:PlayerCanHearPlayersVoice()
    return true, true
end

//---------------------------------------------------------------------

function GM:PlayerSpray(ply)
    return !ply:IsAdmin()
end

//---------------------------------------------------------------------






