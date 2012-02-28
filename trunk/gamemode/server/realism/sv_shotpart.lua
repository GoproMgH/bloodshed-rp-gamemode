function ScaleDamage( ply, hitgroup, dmginfo )
 
    
     if ( hitgroup == HITGROUP_HEAD ) then
 
        dmginfo:ScaleDamage( 1.25 ) --Normal + 25% more pwnage
 
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