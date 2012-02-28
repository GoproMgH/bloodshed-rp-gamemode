
//------------------------------F4 Menu--------------------------------------

local function SparebMenu()

local DermaPanel = vgui.Create( "DFrame" ) -- Creates the frame itself
DermaPanel:SetPos( 50,50 ) -- Position on the players screen
DermaPanel:SetSize( 1000, 900 ) -- Size of the frame
DermaPanel:SetTitle( "F4 menu" ) -- Title of the frame
DermaPanel:SetVisible( true )
DermaPanel:SetDraggable( true ) -- Draggable by mouse?
DermaPanel:ShowCloseButton( true ) -- Show the close button?
DermaPanel:SetMouseInputEnabled(true)
DermaPanel:SetKeyboardInputEnabled(true)
DermaPanel:MakePopup() -- Show the frame

end
usermessage.Hook("SparebMenu", SparebMenu)

function GM:ShowSpare2( ply ) -- This hook is called everytime F4 is pressed.
    umsg.Start( "SparebMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function