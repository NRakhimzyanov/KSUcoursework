
#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура РегистрационныйНомерПриИзменении(Элемент)
	
	ПереименованиеТранспорта();
	
КонецПроцедуры

&НаКлиенте
Процедура МаркаПриИзменении(Элемент)
	
	Объект.Марка = СокрЛП(Объект.Марка);
	Объект.Марка = Объект.Марка + " ";
	ПереименованиеТранспорта();
	
КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
&НаКлиенте
Процедура ПереименованиеТранспорта()
	
	Объект.Наименование = СокрЛП(Объект.Наименование);
	Объект.Наименование = Объект.Марка + Объект.РегистрационныйНомер;
	
КонецПроцедуры
#КонецОбласти