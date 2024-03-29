
#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура РегистрационныйНомерПриИзменении(Элемент)
	РегистрационныйНомерПриИзмененииНаСервере(Объект.РегистрационныйНомер);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Процедура РегистрационныйНомерПриИзмененииНаСервере(РегистрационныйНомер)

	Если НЕ СтрПодобнаПоРегулярномуВыражению(РегистрационныйНомер, 
		"[ABCEHKMOPTXY]{1}\d{3}[ABCEHKMOPTXY]{2}\s\d{3}+RUS") Тогда
		
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = ("Используйте латинские буквы и арабские цифры!");
		Сообщение.Поле = "РегистрационныйНомер";
		Сообщение.ПутьКДанным = "Объект";
		Сообщение.Сообщить();
				
		Возврат;
		
	КонецЕсли;

КонецПроцедуры

#КонецОбласти



