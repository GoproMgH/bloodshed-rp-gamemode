
//------------------------------F3 Menu--------------------------------------

local function SpareaMenu()

local DermaPanel = vgui.Create( "DFrame" ) -- Creates the frame itself
DermaPanel:SetPos( 50,50 ) -- Position on the players screen
DermaPanel:SetSize( 1000, 900 ) -- Size of the frame
DermaPanel:SetTitle( "F3 Menu" ) -- Title of the frame
DermaPanel:SetVisible( true )
DermaPanel:SetDraggable( true ) -- Draggable by mouse?
DermaPanel:ShowCloseButton( true ) -- Show the close button?
DermaPanel:SetMouseInputEnabled(true)
DermaPanel:SetKeyboardInputEnabled(true)
DermaPanel:MakePopup() -- Show the frame

end
usermessage.Hook("SpareaMenu", SpareaMenu)

function GM:ShowSpare1( ply ) -- This hook is called everytime F3 is pressed.
    umsg.Start( "SpareaMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function
