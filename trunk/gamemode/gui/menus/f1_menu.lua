//---------------------------Spawn Menu--------------------------------------

local function HelpMenu()

local DermaPanel = vgui.Create( "DFrame" )
DermaPanel:SetPos( 500,100 )
DermaPanel:SetSize( 925, 585 )
DermaPanel:SetTitle( "Help Menu" )
DermaPanel:SetVisible( true )
DermaPanel:SetDraggable( true )
DermaPanel:ShowCloseButton( true )
DermaPanel:SetMouseInputEnabled(true)
DermaPanel:SetKeyboardInputEnabled(true)
DermaPanel:MakePopup() -- Show the frame

//----------------------------HTML Page--------------------------------------

HTMLTest = vgui.Create("HTML")
HTMLTest:SetParent( DermaPanel )
HTMLTest:SetPos(0,25)
HTMLTest:SetSize(ScrW() - 900, ScrH() - 500)
HTMLTest:OpenURL("http://garrysmod.com")

end
usermessage.Hook("HelpMenu", HelpMenu)

function GM:ShowHelp( ply ) -- This hook is called everytime F1 is pressed.
    umsg.Start( "HelpMenu", ply ) -- Sending a message to the client.
    umsg.End()
end --Ends function