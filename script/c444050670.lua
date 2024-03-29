--真紅眼の鋼炎竜 Metal dragon
function c44405067.initial_effect(c)
	--xyz summon
	--aux.AddXyzProcedure(c,nil,7,2)
	aux.AddFusionProcFun2(c,c44405067.mfilter1,c44405067.mfilter2,true)
	c:EnableReviveLimit()
	--indes
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	--e1:SetCondition(c44405067.indcon)
	--e1:SetValue(1)
	c:RegisterEffect(e1)
	--damage
	--local e2=Effect.CreateEffect(c)
	--e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	--e2:SetCode(EVENT_CHAINING)
	--e2:SetRange(LOCATION_MZONE)
	--e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	--e2:SetOperation(c44405067.regop)
	--c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_CHAIN_SOLVED)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCondition(c44405067.damcon)
	e3:SetOperation(c44405067.damop)
	c:RegisterEffect(e3)
	--spsummon
	local e4=Effect.CreateEffect(c)
	e4:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e4:SetType(EFFECT_TYPE_QUICK_O)
	e4:SetCode(EVENT_FREE_CHAIN)
	e4:SetRange(LOCATION_MZONE)
	e4:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e4:SetCountLimit(1)
	e4:SetCost(c44405067.costLP)
	e4:SetTarget(c44405067.sptg)
	e4:SetOperation(c44405067.spop)
	c:RegisterEffect(e4)
end
c44405067.material_setcode=0x3b
function c44405067.mfilter1(c)
	return c:IsFusionSetCard(0x3b) and c:GetLevel()>6
end
function c44405067.mfilter2(c)
	return c:IsRace(RACE_DRAGON) --and c:GetLevel()==6
end
function c44405067.regop(e,tp,eg,ep,ev,re,r,rp)
	e:GetHandler():RegisterFlagEffect(444050670,RESET_EVENT+0x1fc0000+RESET_CHAIN,0,1)
end
function c44405067.damcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return ep~=tp --and c:GetFlagEffect(44405066)~=0
end
function c44405067.damop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_CARD,0,444050670)
	Duel.Damage(1-tp,500,REASON_EFFECT)
end
function c44405067.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():CheckRemoveOverlayCard(tp,1,REASON_COST) end
	e:GetHandler():RemoveOverlayCard(tp,1,1,REASON_COST)
end
function c44405067.costLP(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckLPCost(tp,1000) end
	Duel.PayLPCost(tp,1000)
end
function c44405067.spfilter(c,e,tp)
	return c:IsSetCard(0x3b) and c:IsCanBeSpecialSummoned(e,0,tp,false,false) --and c:IsType(TYPE_NORMAL) --and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c44405067.sptg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c44405067.spfilter(chkc,e,tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c44405067.spfilter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c44405067.spfilter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,1,0,0)
end
function c44405067.spop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP)
	end
end
