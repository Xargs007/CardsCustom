--Monster Cat (Fix)
function c600006.initial_effect(c)
	--destrroy
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(600006,0))
	e2:SetType(EFFECT_TYPE_TRIGGER_F+EFFECT_TYPE_SINGLE)
	e2:SetCategory(CATEGORY_DESTROY+CATEGORY_DAMAGE+CATEGORY_POSITION)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	--e1:SetCondition(c29146185.retcon)
	e2:SetCountLimit(1,600006)
	e2:SetTarget(c600006.destg)
	e2:SetOperation(c600006.desop)
	c:RegisterEffect(e2)
	--search
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(600006,1))
	e3:SetCategory(CATEGORY_RECOVERY)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetCountLimit(1,600006)
	e3:SetRange(LOCATION_MZONE)
	e3:SetTarget(c600006.target)
	e3:SetOperation(c600006.operation)
	c:RegisterEffect(e3)
end
--function c29146185.retcon(e,tp,eg,ep,ev,re,r,rp)
--	if not re then return false end
--	local rc=re:GetHandler()
--	return rc:IsCode(100000170)
--end
function c600006.defilter2(c)
	return c:IsLevelAbove(5) and c:IsCanChangePosition()
end
function c600006.defilter(c)
	return c:IsLevelBelow(4) and c:IsDestructable()
end
function c600006.destg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	local g=Duel.GetMatchingGroup(c600006.defilter,tp,0,LOCATION_MZONE,nil)
	local g2=Duel.GetMatchingGroup(c600006.defilter2,tp,0,LOCATION_MZONE,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
	Duel.SetOperationInfo(0,CATEGORY_POSITION,g2,g2:GetCount(),0,0)
end
function c600006.desop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(c600006.defilter,tp,0,LOCATION_MZONE,nil)
	local g2=Duel.GetMatchingGroup(c600006.defilter2,tp,0,LOCATION_MZONE,nil)
	Duel.Destroy(g,REASON_EFFECT)
	Duel.ChangePosition(g2,POS_FACEUP_DEFENSE,POS_FACEUP_ATTACK,POS_FACEUP_ATTACK,POS_FACEUP_ATTACK)
	Duel.Damage(1-tp,g:GetCount()*800,REASON_EFFECT)
	Duel.Damage(1-tp,g2:GetCount()*400,REASON_EFFECT)
end
function c600006.filter(c)
	return (c:IsSetCard(0x1538) or c:IsSetCard(0x150e)) and c:IsType(TYPE_MONSTER) and c:IsAbleToHand()
end
function c600006.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c600006.filter,tp,LOCATION_GRAVE,0,1,nil) end
end
function c600006.operation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.SelectMatchingCard(tp,c600006.filter,tp,LOCATION_GRAVE,0,1,1,nil)
	local tc=g:GetFirst()
	Duel.SendtoHand(g,nil,REASON_EFFECT)	
	Duel.ShuffleHand(tp)	
end