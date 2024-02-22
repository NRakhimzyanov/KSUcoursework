#Область ОписаниеПеременных

&НаКлиенте
Перем КоличествоВыходных;
Перем День; 

#КонецОбласти


#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	РасчитатьКоличествоВыходных();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РасчитатьКоличествоВыходных()
	
КоличествоВыходных = 0;
День = НачалоГода(ТекущаяДата());

	Пока День < НачалоНедели(ТекущаяДата()) Цикл
		
		Если ДеньНедели(День) = 6 Тогда
			КоличествоВыходных = КоличествоВыходных + 1;
		ИначеЕсли ДеньНедели(День) = 7 Тогда
			КоличествоВыходных = КоличествоВыходных + 1;
		КонецЕсли;
		
		День = День + 86400;
		
	КонецЦикла;
	
	Сообщение 		= Новый СообщениеПользователю();
	Сообщение.Текст = СтрШаблон("С начала года прошло %1 выходных дней", КоличествоВыходных);
	Сообщение.Сообщить();
	
КонецПроцедуры

#КонецОбласти