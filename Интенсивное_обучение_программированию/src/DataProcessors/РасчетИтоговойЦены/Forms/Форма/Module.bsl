#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура РасчитатьИтоговуюЦену(Команда)
	
	ПроверитьЗапонениеСебестоимости();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПроверитьЗапонениеСебестоимости()
	
	Если НЕ ЗначениеЗаполнено(Объект.СебестоимостьТовара) Тогда
		
		Сообщение 		= Новый СообщениеПользователю();
		Сообщение.Текст = "Не указана себестоимость товара";
		Сообщение.Сообщить();	
		Возврат;
		
	КонецЕсли;
	
	РасчетИтоговойЦены();
	
КонецПроцедуры

&НаКлиенте
Процедура РасчетИтоговойЦены()
	
	Объект.ИтоговаяЦена = (Объект.СебестоимостьТовара * (1 + (Объект.Наценка / 100))) 
						* (1 + (Объект.СтавкаНДС / 100));

	Сообщение 		= Новый СообщениеПользователю();
	Сообщение.Текст = СтрШаблон("Итоговая цена = %1", Объект.ИтоговаяЦена);
	Сообщение.Сообщить();	
	
КонецПроцедуры

#КонецОбласти