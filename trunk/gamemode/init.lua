
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )


--Yes, I Know, Moudlar As Hell

include( "server/sv_spawn.lua" )
include( "server/sv_disconnect.lua" )
include( "server/sv_spray.lua" )



include( 'shared.lua' )

--Unclassified--

include( "gui/menus/f1_menu.lua" )
include( "gui/menus/f1_menu.lua" )
include( "gui/menus/f1_menu.lua" )

---Menus---

include( "gui/menus/f1_menu.lua" )
include( "gui/menus/f2_menu.lua" )
include( "gui/menus/f3_menu.lua" )
include( "gui/menus/f4_menu.lua" )
include( "gui/hud/joinmenu.lua" )

---Realism---

include( "/server/realism/sv_shotpart.lua" )
include( "/server/realism/sv_explosion.lua" )

--Chat--

include( "server/chat/sv_ooc.lua" )
include( "server/chat/sv_g.lua" )
include( "server/chat/sv_local.lua" )
include( "server/chat/sv_msg.lua" )
include( "server/chat/sv_adv.lua" )
include( "server/chat/sv_p.lua" )



function GM:PlayerLoadout( ply )
    ply:StripWeapons()
	ply:Give( "empty_weapon" )
end




