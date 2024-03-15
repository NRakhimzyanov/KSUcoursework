
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
		
	Если Параметры.Период = Неопределено Тогда
		 Параметры.Период = НачалоДня(ТекущаяДатаСеанса());
	КонецЕсли; 
	
	Список.Параметры.УстановитьЗначениеПараметра("Период", Параметры.Период);
	Список.Параметры.УстановитьЗначениеПараметра("Грузчик", Параметры.Грузчик);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыСписок

&НаКлиенте
Процедура СписокВыборЗначения(Элемент, Значение, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
    ОповеститьОВыборе(Значение);
КонецПроцедуры

#КонецОбласти

