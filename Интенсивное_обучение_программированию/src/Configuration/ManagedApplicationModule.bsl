#Область ОбработчикиСобытий

Процедура ПриНачалеРаботыСистемы()
	
	ПроверкаДанныхОрганизации();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

АСИНХ Процедура ПроверкаДанныхОрганизации()
	
ДанныеЗаполнены = РаботаСКонстантамиВызовСервера.ДанныеОрганизацииЗаполнены();
	
	Если НЕ ДанныеЗаполнены Тогда
		
		ЖДАТЬ ПредупреждениеАсинх("Заполните данные организации!", 5, "Данные не заполнены!");
		ОткрытьФорму("ОбщаяФорма.ДанныеОрганизации");
				
	КонецЕсли;
		
КонецПроцедуры

#КонецОбласти
  
