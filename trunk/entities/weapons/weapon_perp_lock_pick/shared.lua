///////////////////////////////
// © 2009-2010 Pulsar Effect //
//    All rights reserved    //
///////////////////////////////
// This material may not be  //
//   reproduced, displayed,  //
//  modified or distributed  //
// without the express prior //
// written permission of the //
//   the copyright holder.   //
///////////////////////////////

if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Lock Pick"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "HuntsKikBut"
SWEP.Instructions = "Left Click: Attempt to pick lock."
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.HoldType = "melee";
SWEP.ViewModel = "models/weapons/v_crowbar.mdl";
SWEP.WorldModel = "models/weapons/w_crowbar.mdl";

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "melee"

SWEP.BreakSound = "doors/handle_pushbar_locked1.wav"
SWEP.BatterSound = "doors/door_locked2.wav"
SWEP.BreakSelfChance = 10;
SWEP.PercentChance = 10;
SWEP.Spawnable = false
SWEP.AdminSpawnable = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize() self:SetWeaponHoldType("melee") end
function SWEP:CanPrimaryAttack ( ) return true; end

function SWEP:TryToBatter ( Target )
	/*
	if Target:GetDoorOwner() == self.Owner then 
		self.Owner:Notify('You pick open your own doors. Use a key!');
		return false;
	end
	*/
	
	self:EmitSound(self.BatterSound);
	
	local function whatlol ( )
		if !self or !self:IsValid() then return false; end
		
		local Randomness = math.random(1, 100);
		
		local SetOffHouseAlarm = true;
		if Randomness <= self.BreakSelfChance then
			self:EmitSound(self.BreakSound);
			self.Owner:Notify('Your lock pick broke!');
			self.Owner:RemoveEquipped(EQUIP_SIDE);
		elseif Randomness <= self.BreakSelfChance + self.PercentChance then		
			Target:Fire('unlock', '', 0);
			Target:Fire('open', '', .5);
			SetOffHouseAlarm = false;
			
			if IsValid(self.Owner) then
				self.Owner:GiveExperience(SKILL_LOCK_PICKING, 25);
			end
		end
		
		if SetOffHouseAlarm then			
			local GroupTable = Target:GetPropertyTable();

			if (GroupTable) then
				local Group = GroupTable.ID;
				
				if GAMEMODE.HouseAlarms[Group] and (!Target:GetTable().LastSirenPlay or Target:GetTable().LastSirenPlay + 30 < CurTime()) and Target:GetDoorOwner() and Target:GetDoorOwner():IsValid() and Target:GetDoorOwner():IsPlayer() then
					umsg.Start("perp_house_alarm");
						umsg.Entity(Target);
					umsg.End();
					
					Target:GetTable().LastSirenPlay = CurTime()
					
					local lifeAlertZone = Target:GetZoneName();
					
					if (lifeAlertZone) then
						GAMEMODE:PlayerSay(self:GetDoorOwner(), "/911 [Burglar Alarm] A break in has occured at " .. lifeAlertZone .. ". Police requested.", true, false);
					else
						Msg("no life alert zone.\n")
					end
				end
			end
		end
	end
	
	if SERVER then
		timer.Simple(1.5, whatlol);
	end
end

function SWEP:PrimaryAttack()
	local EyeTrace = self.Owner:GetEyeTrace()

	if (!EyeTrace.Entity:IsValid() || !EyeTrace.Entity:IsDoor()) then return false; end
	
	local group = EyeTrace.Entity:GetPropertyTable();
	
	if (!group) then return false; end
	
	local Distance = self.Owner:EyePos():Distance(EyeTrace.HitPos);
	
	if Distance > 75 then return false; end
	
	self:TryToBatter(EyeTrace.Entity);

	self.Weapon:SetNextPrimaryFire(CurTime() + 3)
	self.Weapon:SetNextSecondaryFire(CurTime() + 3)
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack();
end
