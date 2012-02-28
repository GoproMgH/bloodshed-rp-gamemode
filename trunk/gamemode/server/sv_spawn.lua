function FirstSpawn( ply )
 
    ply:PrintMessage(HUD_PRINTCENTER,"Welcome to the server!")
 
end
 
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )