#Область ПрограммныйИнтерфейс

// Получить цену продажи номенклатуры.
// 
// Параметры:
//  Номенклатура - СправочникСсылка
// 
// Возвращаемое значение:
//  Число
Функция ПолучитьЦенуПродажиНоменклатуры(Номенклатура) Экспорт
	
	Запрос = Новый Запрос;

	Запрос.УстановитьПараметр("Номенклатура", 	Номенклатура);
	
	Запрос.Текст = "ВЫБРАТЬ
	|	ЕСТЬNULL(Номенклатура.ЦенаПродажи, 0) КАК Цена
	|ИЗ
	|	Справочник.Номенклатура КАК Номенклатура
	|ГДЕ
	|	Номенклатура.Ссылка = &Номенклатура";
	
	РезультатЗапроса = Запрос.Выполнить();
	Выборка = РезультатЗапроса.Выбрать();
	Выборка.Следующий();
	Возврат Выборка.Цена;
	
КонецФункции

#КонецОбласти