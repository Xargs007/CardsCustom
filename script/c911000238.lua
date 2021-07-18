--Slifer the Sky Dragon
function c911000238.initial_effect(c)
	--Summon with 3 Tribute
	c:SetUniqueOnField(1,1,911000238)
	local e1=Effect.CreateEffect(c)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_LIMIT_SUMMON_PROC)
	e1:SetCondition(c911000238.sumoncon)
	e1:SetOperation(c911000238.sumonop)
	e1:SetValue(SUMMON_TYPE_ADVANCE)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_LIMIT_SET_PROC)
	e2:SetCondition(c911000238.setcon)
	c:RegisterEffect(e2)
	--Cannot be Set
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD)
	e3:SetCode(EFFECT_CANNOT_TURN_SET)
	e3:SetRange(LOCATION_MZONE)
	e3:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e3:SetTarget(c911000238.cannotsettg)
	c:RegisterEffect(e3)
	--Summon Cannot be Negated
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_SINGLE)
	e4:SetCode(EFFECT_CANNOT_DISABLE_SUMMON)
	e4:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	c:RegisterEffect(e4)
	--Summon Success: Effects of non-DIVINE monsters Cannot be Activated
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e5:SetCode(EVENT_SUMMON_SUCCESS)
	e5:SetOperation(c911000238.sumnotnegatedop)
	c:RegisterEffect(e5)
	--Race "Dragon"
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_SINGLE)
	e6:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e6:SetRange(LOCATION_MZONE)
	e6:SetCode(EFFECT_ADD_RACE)
	e6:SetValue(RACE_DRAGON)
	c:RegisterEffect(e6)
	--Original ATK/DEF
	local e7=Effect.CreateEffect(c)
	e7:SetType(EFFECT_TYPE_SINGLE)
	e7:SetCode(EFFECT_SET_BASE_ATTACK)
	e7:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e7:SetRange(LOCATION_MZONE)
	e7:SetValue(c911000238.atkdef)
	c:RegisterEffect(e7)
	local e8=e7:Clone()
	e8:SetCode(EFFECT_SET_BASE_DEFENCE)
	c:RegisterEffect(e8)
	--Cannot be Tributed by Opponent
	local e9=Effect.CreateEffect(c)
	e9:SetType(EFFECT_TYPE_SINGLE)
	e9:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e9:SetRange(LOCATION_MZONE)
	e9:SetCode(EFFECT_UNRELEASABLE_SUM)
	e9:SetValue(c911000238.nottributedval)
	c:RegisterEffect(e9)
	local e10=e9:Clone()
	e10:SetCode(EFFECT_UNRELEASABLE_NONSUM)
	e10:SetCondition(c911000238.nottributedcon)
	c:RegisterEffect(e10)
    --Cannot Switch Controller
	local e11=Effect.CreateEffect(c)
	e11:SetType(EFFECT_TYPE_SINGLE)
	e11:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e11:SetRange(LOCATION_MZONE)
	e11:SetCode(EFFECT_CANNOT_CHANGE_CONTROL)
	c:RegisterEffect(e11)
	--Cannot be Targeted by the effects of Spell/Trap Cards and non-DIVINE monsters
	local e12=Effect.CreateEffect(c)
	e12:SetType(EFFECT_TYPE_SINGLE)
	e12:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e12:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e12:SetRange(LOCATION_MZONE)
	e12:SetValue(c911000238.notargetedval)
	c:RegisterEffect(e12)
    --Cannot be Destroyed by the effects of Spell/Trap Cards and non-DIVINE monsters
	local e13=Effect.CreateEffect(c)
	e13:SetType(EFFECT_TYPE_SINGLE)
	e13:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e13:SetRange(LOCATION_MZONE)
	e13:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	e13:SetValue(c911000238.nodestroyedval)
	c:RegisterEffect(e13)
	--Cannot be Removed
	local e14=Effect.CreateEffect(c)
	e14:SetType(EFFECT_TYPE_SINGLE)
	e14:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e14:SetRange(LOCATION_MZONE)
	e14:SetCode(EFFECT_CANNOT_REMOVE)
	c:RegisterEffect(e14)
	--Cannot Send to Grave
	local e15=Effect.CreateEffect(c)
	e15:SetType(EFFECT_TYPE_SINGLE)
	e15:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e15:SetRange(LOCATION_MZONE)
	e15:SetCode(EFFECT_CANNOT_TO_GRAVE)
	e15:SetCondition(c911000238.togravecon)	
	c:RegisterEffect(e15)
	--Cannot Return to Hand
	local e16=Effect.CreateEffect(c)
	e16:SetType(EFFECT_TYPE_SINGLE)
	e16:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e16:SetRange(LOCATION_MZONE)
	e16:SetCode(EFFECT_CANNOT_TO_HAND)
	c:RegisterEffect(e16)
	--Cannot Return to Deck
	local e17=Effect.CreateEffect(c)
	e17:SetType(EFFECT_TYPE_SINGLE)
	e17:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e17:SetRange(LOCATION_MZONE)
	e17:SetCode(EFFECT_CANNOT_TO_DECK)
	c:RegisterEffect(e17)
	--Effect Cannot be Negated
	local e18=Effect.CreateEffect(c)
	e18:SetType(EFFECT_TYPE_SINGLE)
	e18:SetCode(EFFECT_CANNOT_DISABLE)
	e18:SetRange(LOCATION_MZONE)
	c:RegisterEffect(e18)
	--If Special Summoned: Send to Grave
	local e19=Effect.CreateEffect(c)
	e19:SetDescription(aux.Stringid(911000238,0))
	e19:SetCategory(CATEGORY_TOGRAVE)
	e19:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e19:SetRange(LOCATION_MZONE)
	e19:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e19:SetCountLimit(1)
	e19:SetCode(EVENT_PHASE+PHASE_END)
	e19:SetCondition(c911000238.specialsumtogravecon)
	e19:SetTarget(c911000238.specialsumtogravetg)
	e19:SetOperation(c911000238.specialsumtograveop)
	c:RegisterEffect(e19)
	--Change Battle Target when Special Summoned in Defense Position
	local e20=Effect.CreateEffect(c)
	e20:SetDescription(aux.Stringid(911000238,0))
	e20:SetProperty(EFFECT_FLAG_NO_TURN_RESET)
	e20:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e20:SetCode(EVENT_BE_BATTLE_TARGET)
	e20:SetRange(LOCATION_MZONE)
	e20:SetCountLimit(1)
	e20:SetCondition(c911000238.changebattletargetcon)
	e20:SetOperation(c911000238.changebattletargetop)
	c:RegisterEffect(e20)
	--Lightning Blast
	local e21=Effect.CreateEffect(c)
	e21:SetDescription(aux.Stringid(911000238,0))
	e21:SetCategory(CATEGORY_ATKCHANGE+CATEGORY_DEFCHANGE)
	e21:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e21:SetRange(LOCATION_MZONE)
	e21:SetCode(EVENT_SUMMON_SUCCESS)
	e21:SetCondition(c911000238.lightningblastcon)
	e21:SetTarget(c911000238.lightningblasttg)
	e21:SetOperation(c911000238.lightningblastop)
	c:RegisterEffect(e21)
	local e22=e21:Clone()
	e22:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e22)
	local e23=e21:Clone()
	e23:SetCode(EVENT_FLIP_SUMMON_SUCCESS)
	c:RegisterEffect(e23)
	--ATK/DEF effects only affect until the End Phase
	local e24=Effect.CreateEffect(c)
	e24:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e24:SetProperty(EFFECT_FLAG_REPEAT)
	e24:SetRange(LOCATION_MZONE)
	e24:SetCode(EVENT_PHASE+PHASE_END)
	e24:SetCountLimit(1)
	e24:SetOperation(c911000238.atkdefresetop)
	c:RegisterEffect(e24)
	--"Cryomancer of the Ice Barrier" effect only affects until the End Phase
	local e25=Effect.CreateEffect(c)
	e25:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e25:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e25:SetRange(LOCATION_MZONE)
	e25:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e25:SetCountLimit(1)
	e25:SetCondition(c911000238.cryomancercon)
	e25:SetOperation(c911000238.cryomancerop)
	c:RegisterEffect(e25)
	--"Reptilianne Gorgon" effect only affects until the End Phase
	local e26=Effect.CreateEffect(c)
	e26:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e26:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e26:SetRange(LOCATION_MZONE)
	e26:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e26:SetCountLimit(1)
	e26:SetCondition(c911000238.gorgoncon)
	e26:SetOperation(c911000238.gorgonop)
	c:RegisterEffect(e26)
	--"Harpie Lady 3" effect only affects until the End Phase
	local e27=Effect.CreateEffect(c)
	e27:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e27:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e27:SetRange(LOCATION_MZONE)
	e27:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e27:SetCountLimit(1)
	e27:SetCondition(c911000238.harpiecon)
	e27:SetOperation(c911000238.harpieop)
	c:RegisterEffect(e27)
	--"Gora Turtle" effect only affects until the End Phase
	local e28=Effect.CreateEffect(c)
	e28:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e28:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e28:SetRange(LOCATION_MZONE)
	e28:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e28:SetCountLimit(1)
	e28:SetCondition(c911000238.goraturtlecon)
	e28:SetOperation(c911000238.goraturtleop)
	c:RegisterEffect(e28)
	--"Defender of the Ice Barrier" effect only affects until the End Phase
	local e29=Effect.CreateEffect(c)
	e29:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e29:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e29:SetRange(LOCATION_MZONE)
	e29:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e29:SetCountLimit(1)
	e29:SetCondition(c911000238.defendercon)
	e29:SetOperation(c911000238.defenderop)
	c:RegisterEffect(e29)
	--"Photon Delta Wing" effect only affects until the End Phase
	local e30=Effect.CreateEffect(c)
	e30:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e30:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e30:SetRange(LOCATION_MZONE)
	e30:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e30:SetCountLimit(1)
	e30:SetCondition(c911000238.deltawingcon)
	e30:SetOperation(c911000238.deltawingop)
	c:RegisterEffect(e30)
	--"Thousand-Eyes Restrict" effect only affects until the End Phase
	local e31=Effect.CreateEffect(c)
	e31:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e31:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e31:SetRange(LOCATION_MZONE)
	e31:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e31:SetCountLimit(1)
	e31:SetCondition(c911000238.thousandeyescon)
	e31:SetOperation(c911000238.thousandeyesop)
	c:RegisterEffect(e31)
	--"Level Limit - Area B" effect only affects until the End Phase
	local e32=Effect.CreateEffect(c)
	e32:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e32:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e32:SetRange(LOCATION_MZONE)
	e32:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e32:SetCountLimit(1)
	e32:SetCondition(c911000238.levelareacon)
	e32:SetOperation(c911000238.levelareaop)
	c:RegisterEffect(e32)
	--"Swords of Concealing Light" effect only affects until the End Phase
	local e33=Effect.CreateEffect(c)
	e33:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e33:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e33:SetRange(LOCATION_MZONE)
	e33:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e33:SetCountLimit(1)
	e33:SetCondition(c911000238.concealinglightcon)
	e33:SetOperation(c911000238.concealinglightop)
	c:RegisterEffect(e33)
	--"Spiders' Lair" effect only affects until the End Phase
	local e34=Effect.CreateEffect(c)
	e34:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e34:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e34:SetRange(LOCATION_MZONE)
	e34:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e34:SetCountLimit(1)
	e34:SetCondition(c911000238.spiderslaircon)
	e34:SetOperation(c911000238.spiderslairop)
	c:RegisterEffect(e34)
	--"Messenger of Peace" effect only affects until the End Phase
	local e35=Effect.CreateEffect(c)
	e35:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e35:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e35:SetRange(LOCATION_MZONE)
	e35:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e35:SetCountLimit(1)
	e35:SetCondition(c911000238.messengercon)
	e35:SetOperation(c911000238.messengerop)
	c:RegisterEffect(e35)
	--"Swords of Revealing Light" effect only affects until the End Phase
	local e36=Effect.CreateEffect(c)
	e36:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e36:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e36:SetRange(LOCATION_MZONE)
	e36:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e36:SetCountLimit(1)
	e36:SetCondition(c911000238.revealinglightcon)
	e36:SetOperation(c911000238.revealinglightop)
	c:RegisterEffect(e36)
	--"Swords of Burning Light" effect only affects until the End Phase
	local e37=Effect.CreateEffect(c)
	e37:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e37:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e37:SetRange(LOCATION_MZONE)
	e37:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e37:SetCountLimit(1)
	e37:SetCondition(c911000238.burninglightcon)
	e37:SetOperation(c911000238.burninglightop)
	c:RegisterEffect(e37)
	--"Dragon Capture Jar" effect only affects until the End Phase
	local e38=Effect.CreateEffect(c)
	e38:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e38:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e38:SetRange(LOCATION_MZONE)
	e38:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e38:SetCountLimit(1)
	e38:SetCondition(c911000238.dragonjarcon)
	e38:SetOperation(c911000238.dragonjarop)
	c:RegisterEffect(e38)
	--"Final Attack Orders" effect only affects until the End Phase
	local e39=Effect.CreateEffect(c)
	e39:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e39:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e39:SetRange(LOCATION_MZONE)
	e39:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e39:SetCountLimit(1)
	e39:SetCondition(c911000238.finalorderscon)
	e39:SetOperation(c911000238.finalordersop)
	c:RegisterEffect(e39)
	--"Morphtronic Bind" effect only affects until the End Phase
	local e40=Effect.CreateEffect(c)
	e40:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e40:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e40:SetRange(LOCATION_MZONE)
	e40:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e40:SetCountLimit(1)
	e40:SetCondition(c911000238.morphtronicbindcon)
	e40:SetOperation(c911000238.morphtronicbindop)
	c:RegisterEffect(e40)
	--"Gravity Bind" effect only affects until the End Phase
	local e41=Effect.CreateEffect(c)
	e41:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e41:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e41:SetRange(LOCATION_MZONE)
	e41:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e41:SetCountLimit(1)
	e41:SetCondition(c911000238.gravitybindcon)
	e41:SetOperation(c911000238.gravitybindop)
	c:RegisterEffect(e41)
end
function c911000238.sumoncon(e,c)
	if c==nil then return true end
	return Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>-3 and Duel.GetTributeCount(c)>=3
end
function c911000238.sumonop(e,tp,eg,ep,ev,re,r,rp,c)
	local g=Duel.SelectTribute(tp,c,3,3)
	c:SetMaterial(g)
	Duel.Release(g,REASON_SUMMON+REASON_MATERIAL)
end
function c911000238.setcon(e,c)
	if not c then return true end
	return false
end
function c911000238.cannotsettg(e,c)
return c:IsAttribute(ATTRIBUTE_DEVINE)
end
function c911000238.sumnotnegatedop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CANNOT_TRIGGER)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTargetRange(LOCATION_GRAVE,LOCATION_GRAVE+LOCATION_MZONE,LOCATION_MZONE+LOCATION_SZONE,LOCATION_SZONE+LOCATION_HAND,LOCATION_HAND)
	e1:SetTarget(c911000238.triggertg)
	e1:SetReset(RESET_EVENT+EVENT_SUMMON_SUCCESS)
	c:RegisterEffect(e1)
end
function c911000238.triggertg(e,c)
	return not c:IsRace(RACE_DEVINE)
end
function c911000238.adval(e,c)
	return Duel.GetFieldGroupCount(c:GetControler(),LOCATION_HAND,0)*1000
end
function c911000238.nottributedval(e,re,rp)
	local c=e:GetHandler()
 	return not c:IsControler(tp)
end
function c911000238.nottributedcon(e,c)
	local c=e:GetHandler()
	return not c:IsControler(tp)
end
function c911000238.notargetedval(e,te)
	return not te:GetHandler():IsAttribute(ATTRIBUTE_DEVINE)
end
function c911000238.nodestroyedval(e,te)
	return not te:GetHandler():IsAttribute(ATTRIBUTE_DEVINE)
end
function c911000238.togravecon(e,c)
	local c=e:GetHandler()
	return not c:IsCode(10000020)
end
function c911000238.specialsumtogravecon(e,tp,eg,ep,ev,re,r,rp)
	return bit.band(e:GetHandler():GetSummonType(),SUMMON_TYPE_SPECIAL)==SUMMON_TYPE_SPECIAL
end
function c911000238.specialsumtogravetg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,e:GetHandler(),1,0,0)
end
function c911000238.specialsumtograveop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) and c:IsFaceup() then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		c:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		e2:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		c:RegisterEffect(e2)
		Duel.BreakEffect()
		Duel.SendtoGrave(c,REASON_EFFECT)
	end
end
function c911000238.changebattletargetcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return c~=bt and bt:IsControler(tp) and bit.band(e:GetHandler():GetSummonType(),SUMMON_TYPE_SPECIAL)==SUMMON_TYPE_SPECIAL and e:GetHandler():IsDefencePos()
end
function c911000238.changebattletargetop(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangeAttackTarget(e:GetHandler())
end
function c911000238.lightningblastfilter(c,e,tp)
	return c:IsControler(tp) and c:IsPosition(POS_FACEUP_ATTACK) or c:IsControler(tp) and c:IsPosition(POS_FACEUP_DEFENCE) and (not e or c:IsRelateToEffect(e))
end
function c911000238.lightningblastcon(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(c911000238.lightningblastfilter,1,nil,nil,1-tp)
end
function c911000238.lightningblasttg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsRelateToEffect(e) end
	Duel.SetTargetCard(eg)
end
function c911000238.lightningblastop(e,tp,eg,ep,ev,re,r,rp)
	local g=eg:Filter(c911000238.lightningblastfilter,nil,e,1-tp)
	local dg=Group.CreateGroup()
	local c=e:GetHandler()
	local tc=g:GetFirst()
	if tc:IsPosition(POS_FACEUP_ATTACK) then
	while tc do
		local preatk=tc:GetAttack()
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_UPDATE_ATTACK)
		e1:SetValue(-2000)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e1)
		if preatk~=0 and tc:GetAttack()==0 then dg:AddCard(tc) end
		tc=g:GetNext()
	end
	Duel.Destroy(dg,REASON_EFFECT)
	end
	local g=eg:Filter(c911000238.lightningblastfilter,nil,e,1-tp)
	local dg=Group.CreateGroup()
	local c=e:GetHandler()
	local tc=g:GetFirst()
	if tc:IsPosition(POS_FACEUP_DEFENCE) then
	while tc do
		local preatk=tc:GetDefence()
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_UPDATE_DEFENCE)
		e1:SetValue(-2000)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e1)
		if preatk~=0 and tc:GetDefence()==0 then dg:AddCard(tc) end
		tc=g:GetNext()
	end
	Duel.Destroy(dg,REASON_EFFECT)
end
end
function c911000238.atkdefresetop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_SET_BASE_ATTACK)
	e1:SetValue(c911000238.atkdef)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_SET_BASE_DEFENCE)
	c:RegisterEffect(e2)
end
function c911000238.atkdef(e,c)
	return Duel.GetFieldGroupCount(c:GetControler(),LOCATION_HAND,0)*1000
end
function c911000238.cryomancerfilter(c)
	return c:IsFaceup() and c:IsCode(23950192)
end
function c911000238.cryomancercon(e)
	return Duel.IsExistingMatchingCard(c911000238.cryomancerfilter,0,LOCATION_MZONE,LOCATION_MZONE,1,e:GetHandler())
end
function c911000238.cryomancerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.cryomancerimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.cryomancerimmunefilter(e,te)
	return te:GetHandler():IsCode(23950192)
end
function c911000238.gorgonfilter(c)
	return c:IsFaceup() and c:IsCode(43426903)
end
function c911000238.gorgoncon(e)
	return Duel.IsExistingMatchingCard(c911000238.gorgonfilter,tp,0,LOCATION_MZONE,1,nil)
end
function c911000238.gorgonop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.gorgonimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.gorgonimmunefilter(e,te)
	return te:GetHandler():IsCode(43426903)
end
function c911000238.harpiefilter(c)
	return c:IsFaceup() and c:IsCode(54415063)
end
function c911000238.harpiecon(e)
	return Duel.IsExistingMatchingCard(c911000238.harpiefilter,tp,0,LOCATION_MZONE,1,nil)
end
function c911000238.harpieop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.harpieimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.harpieimmunefilter(e,te)
	return te:GetHandler():IsCode(54415063)
end
function c911000238.goraturtlefilter(c)
	return c:IsFaceup() and c:IsCode(80233946)
end
function c911000238.goraturtlecon(e)
	return Duel.IsExistingMatchingCard(c911000238.goraturtlefilter,0,LOCATION_MZONE,LOCATION_MZONE,1,e:GetHandler())
end
function c911000238.goraturtleop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.goraturtleimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.goraturtleimmunefilter(e,te)
	return te:GetHandler():IsCode(80233946)
end
function c911000238.defenderfilter(c)
	return c:IsFaceup() and c:IsCode(82498947)
end
function c911000238.defendercon(e)
	return Duel.IsExistingMatchingCard(c911000238.defenderfilter,tp,0,LOCATION_MZONE,1,nil)
end
function c911000238.defenderop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.defenderimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.defenderimmunefilter(e,te)
	return te:GetHandler():IsCode(82498947)
end
function c911000238.deltawingfilter(c)
	return c:IsFaceup() and c:IsCode(100000240)
end
function c911000238.deltawingcon(e)
	return Duel.IsExistingMatchingCard(c911000238.deltawingfilter,tp,0,LOCATION_MZONE,1,nil)
end
function c911000238.deltawingop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.deltawingimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.deltawingimmunefilter(e,te)
	return te:GetHandler():IsCode(100000240)
end
function c911000238.thousandeyesfilter(c)
	return c:IsFaceup() and c:IsCode(63519819)
end
function c911000238.thousandeyescon(e)
	return Duel.IsExistingMatchingCard(c911000238.thousandeyesfilter,0,LOCATION_MZONE,LOCATION_MZONE,1,e:GetHandler())
end
function c911000238.thousandeyesop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.thousandeyesimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.thousandeyesimmunefilter(e,te)
	return te:GetHandler():IsCode(63519819)
end
function c911000238.levelareafilter(c)
	return c:IsFaceup() and c:IsCode(3136426)
end
function c911000238.levelareacon(e)
	return Duel.IsExistingMatchingCard(c911000238.levelareafilter,0,LOCATION_SZONE,LOCATION_SZONE,1,e:GetHandler())
end
function c911000238.levelareaop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.levelareaimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.levelareaimmunefilter(e,te)
	return te:GetHandler():IsCode(3136426)
end
function c911000238.concealinglightfilter(c)
	return c:IsFaceup() and c:IsCode(12923641)
end
function c911000238.concealinglightcon(e)
	return Duel.IsExistingMatchingCard(c911000238.concealinglightfilter,tp,0,LOCATION_SZONE,1,nil)
end
function c911000238.concealinglightop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.concealinglightimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.concealinglightimmunefilter(e,te)
	return te:GetHandler():IsCode(12923641)
end
function c911000238.spiderslairfilter(c)
	return c:IsFaceup() and c:IsCode(26640671)
end
function c911000238.spiderslaircon(e)
	return Duel.IsExistingMatchingCard(c911000238.spiderslairfilter,tp,0,LOCATION_SZONE,1,nil)
end
function c911000238.spiderslairop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.spiderslairimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.spiderslairimmunefilter(e,te)
	return te:GetHandler():IsCode(26640671)
end
function c911000238.messengerfilter(c)
	return c:IsFaceup() and c:IsCode(44656491)
end
function c911000238.messengercon(e)
	return Duel.IsExistingMatchingCard(c911000238.messengerfilter,0,LOCATION_SZONE,LOCATION_SZONE,1,e:GetHandler())
end
function c911000238.messengerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.messengerimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.messengerimmunefilter(e,te)
	return te:GetHandler():IsCode(44656491)
end
function c911000238.revealinglightfilter(c)
	return c:IsFaceup() and c:IsCode(72302403)
end
function c911000238.revealinglightcon(e)
	return Duel.IsExistingMatchingCard(c911000238.revealinglightfilter,tp,0,LOCATION_SZONE,1,nil)
end
function c911000238.revealinglightop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.revealinglightimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.revealinglightimmunefilter(e,te)
	return te:GetHandler():IsCode(72302403)
end
function c911000238.burninglightfilter(c)
	return c:IsFaceup() and c:IsCode(93087299)
end
function c911000238.burninglightcon(e)
	return Duel.IsExistingMatchingCard(c911000238.burninglightfilter,tp,0,LOCATION_SZONE,1,nil)
end
function c911000238.burninglightop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.burninglightimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.burninglightimmunefilter(e,te)
	return te:GetHandler():IsCode(93087299)
end
function c911000238.dragonjarfilter(c)
	return c:IsFaceup() and c:IsCode(50045299)
end
function c911000238.dragonjarcon(e)
	return Duel.IsExistingMatchingCard(c911000238.dragonjarfilter,0,LOCATION_SZONE,LOCATION_SZONE,1,e:GetHandler())
end
function c911000238.dragonjarop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.dragonjarimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.dragonjarimmunefilter(e,te)
	return te:GetHandler():IsCode(50045299)
end
function c911000238.finalordersfilter(c)
	return c:IsFaceup() and c:IsCode(52503575)
end
function c911000238.finalorderscon(e)
	return Duel.IsExistingMatchingCard(c911000238.finalordersfilter,0,LOCATION_SZONE,LOCATION_SZONE,1,e:GetHandler())
end
function c911000238.finalordersop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.finalordersimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.finalordersimmunefilter(e,te)
	return te:GetHandler():IsCode(52503575)
end
function c911000238.morphtronicbindfilter(c)
	return c:IsFaceup() and c:IsCode(85101228)
end
function c911000238.morphtronicbindcon(e)
	return Duel.IsExistingMatchingCard(c911000238.morphtronicbindfilter,tp,0,LOCATION_SZONE,1,nil)
end
function c911000238.morphtronicbindop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.morphtronicbindimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.morphtronicbindimmunefilter(e,te)
	return te:GetHandler():IsCode(85101228)
end
function c911000238.gravitybindfilter(c)
	return c:IsFaceup() and c:IsCode(85742772)
end
function c911000238.gravitybindcon(e)
	return Duel.IsExistingMatchingCard(c911000238.gravitybindfilter,0,LOCATION_SZONE,LOCATION_SZONE,1,e:GetHandler())
end
function c911000238.gravitybindop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
	e1:SetValue(c911000238.gravitybindimmunefilter)
	c:RegisterEffect(e1)
end
function c911000238.gravitybindimmunefilter(e,te)
	return te:GetHandler():IsCode(85742772)
end