#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
#Область ОбработчикиСобытий
		
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
		
	Условие = Не ПредрейсовыйМедицинскийОсмотр;
	ТранспортныйОтделВызовСервера.ПроверитьУсловие(Отказ, Условие, "Водитель не имеет медицинского допуска!");
	
	Условие = НЕ ИнструктажПоТехникеБезопасности;
	ТранспортныйОтделВызовСервера.ПроверитьУсловие(Отказ, Условие, "Членам бригады не проведен инструктаж!");	
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ,Режим)

	ЗаписатьДвижения();
		
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаписатьДвижения()
		
	Движения.СоставБригады.Записывать = Истина;
	Движение = Движения.СоставБригады.Добавить();
	Движение.Период = Дата;
	ЗаполнитьЗначенияСвойств(Движение, ЭтотОбъект);	
		
КонецПроцедуры

#КонецОбласти
#Иначе
  ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли