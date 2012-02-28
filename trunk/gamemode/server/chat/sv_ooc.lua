



function ISaid( ply, text, public )
    if (string.sub(text, 1, 4) == "/ooc") then--if the first 4 letters are /ooc continue
        return "[OOC]"..string.sub( text, 5 );--add [OOC] infront of the players text then display
    end
end
hook.Add( "PlayerSay", "ISaid", ISaid );