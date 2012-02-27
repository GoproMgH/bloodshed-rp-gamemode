
/*---------------------------------------
 The Spawn Menu - (The one when you join)
---------------------------------------*/

//---------------------------Spawn Menu--------------------------------------

local function SpawnMenu()

local DermaPanel = vgui.Create( "DFrame" ) -- Creates the frame itself
DermaPanel:SetPos( 500,100 ) -- Position on the players screen
DermaPanel:SetSize( 925, 700 ) -- Size of the frame
DermaPanel:SetTitle( "Welcome To BloodShed RP v1.0" ) -- Title of the frame
DermaPanel:SetVisible( true )
DermaPanel:SetDraggable( false ) -- Draggable by mouse?
DermaPanel:ShowCloseButton( false ) -- Show the close button?
DermaPanel:SetMouseInputEnabled(true)
DermaPanel:SetKeyboardInputEnabled(false)
DermaPanel:MakePopup() -- Show the frame

//----------------------------HTML Page--------------------------------------

HTMLTest = vgui.Create("HTML")
HTMLTest:SetParent( DermaPanel )
HTMLTest:SetPos(0,25)
HTMLTest:SetSize(ScrW() - 900, ScrH() - 500)
HTMLTest:OpenURL("http://garrysmod.com")

//---------------------------Yes Button--------------------------------------

local DermaButton = vgui.Create( "DButton" )
DermaButton:SetParent( DermaPanel )
DermaButton:SetText( "Yes - I Understand & Accept" )
DermaButton:SetPos( 10, 620 )
DermaButton:SetSize( 435, 50 )
DermaButton.DoClick = function ()
    DermaPanel:SetVisible( false ) -- Makes the panel go away
end

//----------------------------No Button--------------------------------------

local DermaButton = vgui.Create( "DButton" )
DermaButton:SetParent( DermaPanel )
DermaButton:SetText( "No - I Don't Understand And/Or Accept" )
DermaButton:SetPos( 480, 620 )
DermaButton:SetSize( 435, 50 )
DermaButton.DoClick = function ()
    RunConsoleCommand( "quit" ) -- Makes the player leave the server if they ckick "No"
end

end
usermessage.Hook("SpawnMenu", SpawnMenu)