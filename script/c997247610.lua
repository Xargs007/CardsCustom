--XZ－キャタピラー・キャノン
function c997247610.initial_effect(c)
	--fusion material
	c:EnableReviveLimit()
	--aux.AddFusionProcCode2(c,62651957,64500000,true,true)
	Fusion.AddProcMix(c,true,true,62651957,64500000)
	Fusion.AddContactProc(c,c997247610.contactfil,c997247610.contactop,c997247610.splimit)
	--spsummon condition
	--local e1=Effect.CreateEffect(c)
	--e1:SetType(EFFECT_TYPE_SINGLE)
	--e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	--e1:SetCode(EFFECT_SPSUMMON_CONDITION)
	--e1:SetValue(c997247610.splimit)
	--c:RegisterEffect(e1)
	--special summon rule
	--local e2=Effect.CreateEffect(c)
	--e2:SetType(EFFECT_TYPE_FIELD)
	--e2:SetCode(EFFECT_SPSUMMON_PROC)
	--e2:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	--e2:SetRange(LOCATION_EXTRA)
	--e2:SetCountLimit(1,(91998119 or 91998120 or 91998121 or 2111707 or 25119460 or 997247610))
	--e2:SetCondition(c997247610.spcon)
	--e2:SetOperation(c997247610.spop)
	--c:RegisterEffect(e2)
	--destroy
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(997247610,0))
	e3:SetCategory(CATEGORY_DESTROY)
	e3:SetType(EFFECT_TYPE_IGNITION+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCountLimit(2, 997247610)
	e3:SetCost(c997247610.descost)
	e3:SetTarget(c997247610.destg)
	e3:SetOperation(c997247610.desop)
	c:RegisterEffect(e3)
	--special summon
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(997247610,1))
	e4:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e4:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e4:SetType(EFFECT_TYPE_IGNITION+EFFECT_TYPE_TRIGGER_O)
	e4:SetRange(LOCATION_MZONE)
	e4:SetCost(c997247610.spcost)
	e4:SetTarget(c997247610.target)
	e4:SetOperation(c997247610.operation)
	c:RegisterEffect(e4)
end
function c997247610.splimit(e,se,sp,st)
	return not e:GetHandler():IsLocation(LOCATION_EXTRA+LOCATION_GRAVE)
end
function c997247610.contactfil(tp)
	return Duel.GetMatchingGroup(Card.IsAbleToGraveAsCost,tp,LOCATION_ONFIELD,0,nil)--Duel.GetMatchingGroup(Card.IsAbleToRemoveAsCost,tp,LOCATION_ONFIELD,0,nil)
end
function c997247610.contactop(g)
	--Duel.Remove(g,POS_FACEUP,REASON_COST+REASON_MATERIAL)
	Duel.SendtoGrave(g,POS_FACEUP,REASON_COST+REASON_MATERIAL)
end
function c997247610.spfilter(c,code)
	return c:IsFusionCode(code) and c:IsAbleToGraveAsCost()
end
function c997247610.spcon(e,c)
	if c==nil then return true end
	local tp=c:GetControler()
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	if ft<-1 then return false end
	local g1=Duel.GetMatchingGroup(c997247610.spfilter,tp,LOCATION_ONFIELD,0,nil,62651957)
	local g2=Duel.GetMatchingGroup(c997247610.spfilter,tp,LOCATION_ONFIELD,0,nil,64500000)
	if g1:GetCount()==0 or g2:GetCount()==0 then return false end
	if g1:GetCount()==1 and g2:GetCount()==1 and g1:GetFirst()==g2:GetFirst() then return false end
	if ft>0 then return true end
	local f1=g1:FilterCount(Card.IsLocation,nil,LOCATION_MZONE)
	local f2=g2:FilterCount(Card.IsLocation,nil,LOCATION_MZONE)
	if ft==-1 then return f1>0 and f2>0
	else return f1>0 or f2>0 end
end
function c997247610.spop(e,tp,eg,ep,ev,re,r,rp,c)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	local g1=Duel.GetMatchingGroup(c997247610.spfilter,tp,LOCATION_ONFIELD,0,nil,62651957)
	local g2=Duel.GetMatchingGroup(c997247610.spfilter,tp,LOCATION_ONFIELD,0,nil,64500000)
	g1:Merge(g2)
	local g=Group.CreateGroup()
	local tc=nil
	for i=1,2 do
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
		if ft<=0 then
			tc=g1:FilterSelect(tp,Card.IsLocation,1,1,nil,LOCATION_MZONE):GetFirst()
			ft=ft+1
		else
			tc=g1:Select(tp,1,1,nil):GetFirst()
		end
		g:AddCard(tc)
		if i==1 then
			g1:Clear()
			if tc:IsFusionCode(64500000) then
				local sg=Duel.GetMatchingGroup(c997247610.spfilter,tp,LOCATION_ONFIELD,0,tc,62651957)
				g1:Merge(sg)
			end
			if tc:IsFusionCode(62651957) then
				local sg=Duel.GetMatchingGroup(c997247610.spfilter,tp,LOCATION_ONFIELD,0,tc,64500000)
				g1:Merge(sg)
			end
		end
	end
	Duel.SendtoGrave(g,POS_FACEUP,REASON_COST)
end
function c997247610.descost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsDiscardable,tp,LOCATION_HAND,0,1,nil) end
	Duel.DiscardHand(tp,Card.IsDiscardable,1,1,REASON_COST+REASON_DISCARD)
end
function c997247610.filter(c)
	return c:IsFacedown() and c:IsDestructable()
end
function c997247610.destg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_SZONE) and chkc:IsControler(1-tp) and c997247610.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c997247610.filter,tp,0,LOCATION_SZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectTarget(tp,c997247610.filter,tp,0,LOCATION_SZONE,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
end
function c997247610.desop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and tc:IsFacedown() then
		Duel.Destroy(tc,REASON_EFFECT)
	end
end
--
function c997247610.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:IsAbleToExtraAsCost() end
	Duel.SendtoDeck(c,nil,0,REASON_COST)
end
function c997247610.spmfilter(c,e,tp,code)
	return c:IsCode(code) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c997247610.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return false end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>=1
		and Duel.IsExistingTarget(c997247610.spmfilter,tp,LOCATION_GRAVE,0,1,nil,e,tp,62651957)
		and Duel.IsExistingTarget(c997247610.spmfilter,tp,LOCATION_GRAVE,0,1,nil,e,tp,64500000) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g1=Duel.SelectTarget(tp,c997247610.spmfilter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp,62651957)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g2=Duel.SelectTarget(tp,c997247610.spmfilter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp,64500000)
	g1:Merge(g2)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g1,2,0,0)
end
function c997247610.operation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetChainInfo(0,CHAININFO_TARGET_CARDS):Filter(Card.IsRelateToEffect,nil,e)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	if g:GetCount()~=2 or ft<2 then return end
	Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
end
