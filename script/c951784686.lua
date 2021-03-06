--ティマイオスの眼
function c951784686.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,91784686+EFFECT_COUNT_CODE_OATH)
	e1:SetTarget(c951784686.target)
	e1:SetOperation(c951784686.activate)
	c:RegisterEffect(e1)
	--add code
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e2:SetCode(EFFECT_ADD_CODE)
	e2:SetValue(10000050)
	c:RegisterEffect(e2)
end
function c951784686.tgfilter0(c,e,tp)
	return c:IsFaceup() and c:IsCanBeFusionMaterial() and c:IsRace(RACE_SPELLCASTER) --IsSetCard(0x2) and c:IsCanBeFusionMaterial()
		and Duel.IsExistingMatchingCard(c951784686.spfilter,tp,LOCATION_EXTRA,0,1,nil,e,tp,c:GetCode())
end
function c951784686.tgfilter(c,e,tp)
	return c:IsFaceup() and c:IsCanBeFusionMaterial() and c:IsRace(RACE_SPELLCASTER) --IsSetCard(0x2) and c:IsCanBeFusionMaterial()
		and not c:IsImmuneToEffect(e)
		and Duel.IsExistingMatchingCard(c951784686.spfilter,tp,LOCATION_EXTRA,0,1,nil,e,tp,c:GetCode())
end
function c951784686.spfilter(c,e,tp,code)
	return c:IsCanBeSpecialSummoned(e,SUMMON_TYPE_FUSION,tp,false,false) and aux.IsMaterialListCode(c,code) or c:IsCode(21113684) --and (c:IsCode(98502113) or c:IsCode(13722870) or c:IsCode(43892408) or c:IsCode(75380687) or c:IsCode(170000158) or c:IsCode(170000157) or c:IsCode(21113684) or c:IsCode(02509841) or c:IsCode(511000990) or c:IsCode(53539634) or c:IsCode(94977269) or c:IsCode(41544074) or c:IsCode(63519819)) --aux.IsMaterialListCode(c,code) and
end
function c951784686.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc==0 then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(tp) and c951784686.tgfilter(chkc,e,tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>-1
		and Duel.IsExistingTarget(c951784686.tgfilter0,tp,LOCATION_MZONE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TARGET)
	Duel.SelectTarget(tp,c951784686.tgfilter,tp,LOCATION_MZONE,0,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_EXTRA)
end
function c951784686.activate(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<0 then return end
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and tc:IsFaceup() and ((tc:IsSetCard(0x20a2) or tc:IsCode(80014003)) and not (tc:IsCode(38033121))) then
		local sg=Duel.SelectMatchingCard(tp,c951784686.spMfilter,tp,LOCATION_EXTRA,0,1,1,nil,e,tp,tc:GetCode())
		local sc=sg:GetFirst()
		if sc then
			sc:SetMaterial(Group.FromCards(tc))
			Duel.SendtoGrave(tc,REASON_EFFECT+REASON_MATERIAL+REASON_FUSION)
			Duel.BreakEffect()
			Duel.SpecialSummon(sc,SUMMON_TYPE_FUSION,tp,tp,false,false,POS_FACEUP)
			sc:CompleteProcedure()
		end
	end
	if tc:IsRelateToEffect(e) and tc:IsFaceup() and tc:IsCanBeFusionMaterial() and not tc:IsImmuneToEffect(e) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local sg=Duel.SelectMatchingCard(tp,c951784686.spfilter,tp,LOCATION_EXTRA,0,1,1,nil,e,tp,tc:GetCode())
		local sc=sg:GetFirst()
		if sc then
			sc:SetMaterial(Group.FromCards(tc))
			Duel.SendtoGrave(tc,REASON_EFFECT+REASON_MATERIAL+REASON_FUSION)
			Duel.BreakEffect()
			Duel.SpecialSummon(sc,SUMMON_TYPE_FUSION,tp,tp,false,false,POS_FACEUP)
			sc:CompleteProcedure()
		end
	end
end
---
function c951784686.spMfilter(c,e,tp,code)
	return c:IsCanBeSpecialSummoned(e,SUMMON_TYPE_FUSION,tp,false,false) and (c:IsCode(90090125) or c:IsCode(21113684)) --c900901253 and (c:IsCode(98502113) or c:IsCode(13722870) or c:IsCode(43892408) or c:IsCode(75380687) or c:IsCode(170000158) or c:IsCode(170000157) or c:IsCode(21113684) or c:IsCode(02509841) or c:IsCode(511000990) or c:IsCode(53539634) or c:IsCode(94977269) or c:IsCode(41544074) or c:IsCode(63519819)) --aux.IsMaterialListCode(c,code) and
end