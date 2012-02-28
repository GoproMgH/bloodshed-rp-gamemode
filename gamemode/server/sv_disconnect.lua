function fPlayerDisconnect( ply )
    // Print to chat that a player has disconnected from the server.
    PrintMessage( HUD_PRINTTALK, ply:GetName() .. " has left the server." )
end
// Add PlayerDisconnected hook that calls our function.
hook.Add( "PlayerDisconnected", "playerdisconnected", fPlayerDisconnect )
