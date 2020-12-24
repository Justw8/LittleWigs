
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("MythicPlusAffixes", 9999, 9999)
if not mod then return end
--mod:RegisterEnableMob(0)
--mod.engageId = 0
--mod.respawnTime = 30

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		342466, -- Belligerent Boast
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "BelligerentBoast", 342466)
	self:Log("SPELL_AURA_REMOVED", "BelligerentBoastRemoved", 342466)
end

--function mod:OnEngage()
--end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BelligerentBoast(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
		self:SayCountdown(args.spellId, 4)
		self:Flash(args.spellId)
		self:PlaySound(args.spellId, "warning")
	else
		self:PlaySound(args.spellId, "alarm")
	end
	self:TargetMessage(args.spellId, args.destName, "yellow")
end

function mod:BelligerentBoastRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end