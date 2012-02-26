include( 'shared.lua' )

local function HelpMenu()

    local Menu = vgui.Create("DFrame")
    Menu:SetPos(ScrW() / 2 - 400, ScrH() / 2 - 400)
    Menu:SetSize(800, 700)
    Menu:SetText("Help Menu")
    Menu:SetDraggable(false)
    Menu:ShowCloseButton(true)
    Menu:MakePopup()
 
    local Text = vgui.Create("DLabel",Menu)
    //You can leave out the parentheses if there is a single string as an argument.
    Text:SetText "You opened the menu!"
	Text:SizeToContents()
    Text:Center()
end
usermessage.Hook("HelpMenu", HelpMenu)

local function TeamMenu()

    local Menu = vgui.Create("DFrame")
    Menu:SetPos(ScrW() / 2 - 400, ScrH() / 2 - 400)
    Menu:SetSize(800, 700)
    Menu:SetText("Team Menu")
    Menu:SetDraggable(false)
    Menu:ShowCloseButton(true)
    Menu:MakePopup()
 
    local Text = vgui.Create("DLabel",Menu)
    //You can leave out the parentheses if there is a single string as an argument.
    Text:SetText "You opened the menu!"
	Text:SizeToContents()
    Text:Center()
end
usermessage.Hook("TeamMenu", TeamMenu)

local function SpareaMenu()

    local Menu = vgui.Create("DFrame")
    Menu:SetPos(ScrW() / 2 - 400, ScrH() / 2 - 400)
    Menu:SetSize(800, 700)
    Menu:SetText("Spare Menu One")
    Menu:SetDraggable(false)
    Menu:ShowCloseButton(true)
    Menu:MakePopup()
 
    local Text = vgui.Create("DLabel",Menu)
    //You can leave out the parentheses if there is a single string as an argument.
    Text:SetText "You opened the menu!"
	Text:SizeToContents()
    Text:Center()
end
usermessage.Hook("SpareaMenu", SpareaMenu)

local function SparebMenu()

    local Menu = vgui.Create("DFrame")
    Menu:SetPos(ScrW() / 2 - 400, ScrH() / 2 - 400)
    Menu:SetSize(800, 700)
    Menu:SetText("Spare Menu Two")
    Menu:SetDraggable(false)
    Menu:ShowCloseButton(true)
    Menu:MakePopup()
 
    local Text = vgui.Create("DLabel",Menu)
    //You can leave out the parentheses if there is a single string as an argument.
    Text:SetText "You opened the menu!"
	Text:SizeToContents()
    Text:Center()
end
usermessage.Hook("", SparebMenu)
// Clientside only stuff goes here