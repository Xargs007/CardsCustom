--Dark Necrofear (Manga)
--Scripted by Edo9300
function c911004006.initial_effect(c)
	--c:EnableReviveLimit()
	--special summon
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_SPSUMMON_PROC)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(c911004006.spcon)
	e1:SetOperation(c911004006.spop)
	c:RegisterEffect(e1)
	--possess
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_DAMAGE_STEP)
	--e2:SetCode(EVENT_DESTROYED)
	e2:SetCode(EVENT_TO_GRAVE)
	e2:SetCondition(c911004006.con)
	e2:SetOperation(c911004006.op)
	c:RegisterEffect(e2)
	--
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_PHASE_START+PHASE_BATTLE)
	e3:SetRange(LOCATION_GRAVE)
	e3:SetOperation(c911004006.op2)
	c:RegisterEffect(e3)
	--Gain and Damage
	--local e4=Effect.CreateEffect(c)
	--e4:SetCategory(CATEGORY_DAMAGE+CATEGORY_RECOVER)
	--e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	--e4:SetCode(EVENT_ATTACK_ANNOUNCE)
	--e4:SetRange(LOCATION_GRAVE)
	--e4:SetCondition(c911004006.dmcon)
	--e4:SetTarget(c911004006.dmtg)
	--e4:SetOperation(c911004006.dmop)
	--c:RegisterEffect(e4)
	--Activate
	local e4=Effect.CreateEffect(c)
	e4:SetCategory(CATEGORY_DAMAGE)
	e4:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e4:SetCode(EVENT_ATTACK_ANNOUNCE)
	e4:SetCondition(c911004006.dmcon)
	e4:SetCountLimit(1)
	e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e4:SetHintTiming(TIMING_DAMAGE_STEP)
	e4:SetRange(LOCATION_GRAVE)
	e4:SetTarget(c911004006.target)
	e4:SetOperation(c911004006.activate)
	c:RegisterEffect(e4)
	if not c911004006.global_check then
		c911004006.global_check=true
		local ge1=Effect.CreateEffect(c)
		--ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		--ge1:SetCode(EVENT_DESTROYED)
		ge1:SetCode(EVENT_TO_GRAVE)
		ge1:SetOperation(c911004006.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end

--function c911004006.condition(e,tp,eg,ep,ev,re,r,rp)
--	return tp~=Duel.GetTurnPlayer()
--end
function c911004006.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local tg=Duel.GetAttacker()
	if chkc then return chkc==tg end
	if chk==0 then return tg:IsOnField() and tg:IsCanBeEffectTarget(e) end
	Duel.SetTargetCard(tg)
	local dam=tg:GetAttack()/2
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,dam)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,dam)
end

function c911004006.activate(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		if Duel.NegateAttack() then
			Duel.Recover(tp,tc:GetAttack()/2,REASON_EFFECT)
			Duel.Damage(1-tp,tc:GetAttack()/2,REASON_EFFECT)
		end
	end
end



function c911004006.checkop(e,tp,eg,ep,ev,re,r,rp)
	local tc=eg:GetFirst()
	while tc do
		if tc:GetFlagEffect(911004006)==0 and tc:IsType(TYPE_MONSTER) and (tc:GetPreviousPosition()==POS_FACEUP_ATTACK or tc:GetPreviousPosition()==POS_ATTACK) then
		--if tc:IsType(TYPE_MONSTER) and (tc:GetPreviousPosition()==POS_FACEUP_ATTACK or tc:GetPreviousPosition()==POS_ATTACK) then
			tc:RegisterFlagEffect(911004006+1,RESET_PHASE+PHASE_END,0,5)
		end
		tc=eg:GetNext()
	end
end
function c911004006.spfilter(c)
	return c:GetFlagEffect(911004006+1)>0 and c:IsAbleToRemoveAsCost() --
end
function c911004006.spcon(e,c)
	if c==nil then return true end
	local tp=c:GetControler()
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c911004006.spfilter,tp,LOCATION_GRAVE,0,3,nil)
end
function c911004006.spop(e,tp,eg,ep,ev,re,r,rp,c)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g=Duel.SelectMatchingCard(tp,c911004006.spfilter,tp,LOCATION_GRAVE,0,3,3,nil)
	Duel.Remove(g,POS_FACEUP,REASON_COST)
end
function c911004006.con(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	return e:GetHandler():GetLocation()==LOCATION_GRAVE
end
function c911004006.op(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	c:RegisterFlagEffect(911004006+2,0,0,1)
	if Duel.GetCurrentPhase()>=8 and Duel.GetCurrentPhase()<=20 and Duel.GetTurnPlayer()~=tp then
		local tc=Duel.SelectMatchingCard(c:GetOwner(),nil,c:GetOwner(),0,LOCATION_MZONE,1,1,nil):GetFirst()
		if tc then
			tc:RegisterFlagEffect(911004006,RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END,0,1)
		end
	end
end
function c911004006.op2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.GetTurnPlayer()~=tp then
		local tc=Duel.SelectMatchingCard(c:GetOwner(),nil,c:GetOwner(),0,LOCATION_MZONE,1,1,nil):GetFirst()
		if tc then
			tc:RegisterFlagEffect(911004006,RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END,0,1)
		end
	end
end
function c911004006.dmcon(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	return Duel.GetAttacker():GetControler()~=tp and e:GetHandler():GetLocation()==LOCATION_GRAVE and not Duel.IsExistingMatchingCard(c911004006.filter122,tp,LOCATION_SZONE+LOCATION_FZONE,0,1,nil)--Duel.GetAttacker():GetFlagEffect(911004006)>0 and Duel.GetAttacker():GetControler()~=tp
end
function c911004006.filter122(c)
	return c:IsFaceup() and (c:IsCode(100417010) or c:IsCode(511000119))
end
function c911004006.dmtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return true end
	local c=Duel.GetAttacker()
	local dam=c:GetAttack()/2
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,dam)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,dam)
end
function c911004006.dmop(e,tp,eg,ep,ev,re,r,rp)
	local c=Duel.GetAttacker()
	local dam=c:GetAttack()/2
	if Duel.NegateAttack() then
		Duel.Recover(tp,dam,REASON_EFFECT)
		Duel.Damage(1-tp,dam,REASON_EFFECT)
	end
end
