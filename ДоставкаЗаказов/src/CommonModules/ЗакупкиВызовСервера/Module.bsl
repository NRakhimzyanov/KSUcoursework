#Область ПрограммныйИнтерфейс

// Получить цену покупки номенклатуры.
// 
// Параметры:
//  Дата - Дата
//  Контрагент - СправочникСсылка
//  Номенклатура - СправочникСсылка
// 
// Возвращаемое значение:
//  Число
Функция ПолучитьЦенуПокупкиНоменклатуры(Дата, Контрагент, Номенклатура) Экспорт
	
	Запрос = Новый Запрос;
	
	Запрос.УстановитьПараметр("Дата", 			Дата);
	Запрос.УстановитьПараметр("Контрагент", 	Контрагент);
	Запрос.УстановитьПараметр("Номенклатура", 	Номенклатура);
	
	Запрос.Текст = "
	|ВЫБРАТЬ
	|	Цена
	|ИЗ
	|	РегистрСведений.ЦеныПоставщиков.СрезПоследних(&Дата, 
	|													Контрагент 		= &Контрагент 
	|												    И Номенклатура 	= &Номенклатура)
	|";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если РезультатЗапроса.Пустой() Тогда
		
		Запрос.Текст = "ВЫБРАТЬ
		|	ЕСТЬNULL(Номенклатура.ЦенаПокупки, 0) КАК Цена
		|ИЗ
		|	Справочник.Номенклатура КАК Номенклатура
		|ГДЕ
		|	Номенклатура.Ссылка = &Номенклатура";
		
		РезультатЗапроса = Запрос.Выполнить();
		Выборка = РезультатЗапроса.Выбрать();
		Выборка.Следующий();
		Возврат Выборка.Цена;
		
	Иначе
		
		Выборка = РезультатЗапроса.Выбрать();
		Выборка.Следующий();
		Возврат Выборка.Цена;
		
	КонецЕсли;
	
КонецФункции

#КонецОбласти