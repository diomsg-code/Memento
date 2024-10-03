local _, Memento = ...

function MementoMarkNormalFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_NORMAL_FONT)
end

function MementoMarkWhiteFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_WHITE_FONT)
end

function MementoMarkOrangeFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_ORANGE_FONT)
end

function MementoMarkGoldFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_GOLD_FONT)
end
