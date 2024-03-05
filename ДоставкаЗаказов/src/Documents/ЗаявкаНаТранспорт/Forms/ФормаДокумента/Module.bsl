
#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ТранспортНачалоВыбора(Элемент, ДанныеВыбора, ВыборДобавлением, СтандартнаяОбработка)
	
	СтандартнаяОбработка 	= Ложь;
	ТранспортСБригадой 		= ТранспортСБригадой(Объект.Дата);
	ОбщегоНазначенияКлиент.ФормированиеИОткрытиеФормы(ТранспортСБригадой, "Справочник.ТранспортныеСредства.ФормаВыбора", Элементы.Транспорт, "Наименование")
	
КонецПроцедуры

&НаКлиенте
Процедура ТранспортОбработкаВыбора(Элемент, ВыбранноеЗначение, ДополнительныеДанные, 
									ВыборДобавлением, СтандартнаяОбработка)
    СтандартнаяОбработка 	= Ложь;
    Объект.Транспорт 	= ВыбранноеЗначение;
	БригадаЗакрепленнаяЗаТранспортом();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Функция ТранспортСБригадой(Дата)
	
	ТранспортСБригадой = Новый СписокЗначений();
	
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	СоставБригадыСрезПоследних.Транспорт
	|ИЗ
	|	РегистрСведений.СоставБригады.СрезПоследних(&Дата, Транспорт НЕ В
	|		(ВЫБРАТЬ
	|			СостояниеДоставкиСрезПоследних.Транспорт
	|		ИЗ
	|			РегистрСведений.СостояниеДоставки.СрезПоследних(&Дата, СостояниеЗаказа <> &СостояниеЗаказа) КАК
	|				СостояниеДоставкиСрезПоследних)) КАК СоставБригадыСрезПоследних";
	
	Запрос.УстановитьПараметр("СостояниеЗаказа", Перечисления.СостояниеЗаказа.Отработан);
	Запрос.УстановитьПараметр("Дата", Дата);
	РезультатЗапроса = Запрос.Выполнить();
	ТЗ = РезультатЗапроса.Выгрузить();
	Текст = "Состав бригады не назначен!";
	Выборка = ОбщегоНазначенияВызовСервера.ПроверкаРезультатаЗапроса(РезультатЗапроса, Текст);
	ТранспортСБригадой = ОбщегоНазначенияВызовСервера.ФормированиеСтруктурыОтбора(Выборка, Выборка.Транспорт);
	
	Возврат ТранспортСБригадой;

КонецФункции

&НаСервере
Процедура БригадаЗакрепленнаяЗаТранспортом()
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	СоставБригадыСрезПоследних.Водитель.Ссылка КАК Водитель,
		|	СоставБригадыСрезПоследних.ГрузчикПервый КАК ГрузчикПервый,
		|	СоставБригадыСрезПоследних.ГрузчикВторой КАК ГрузчикВторой,
		|	СоставБригадыСрезПоследних.НачальныйПробег
		|ИЗ
		|	РегистрСведений.СоставБригады.СрезПоследних(&Дата, Транспорт = &Транспорт) КАК СоставБригадыСрезПоследних";
	
	Запрос.УстановитьПараметр("Транспорт", Объект.Транспорт);
	Запрос.УстановитьПараметр("Дата", Объект.Дата);
	РезультатЗапроса = Запрос.Выполнить();
	
	Текст = "Состав бригады не назначен!";
	Выборка = ОбщегоНазначенияВызовСервера.ПроверкаРезультатаЗапроса(РезультатЗапроса, Текст);
	
	Выборка.Следующий();
	Объект.Водитель = Выборка.Водитель;
	Объект.ГрузчикПервый = Выборка.ГрузчикПервый;
	Объект.ГрузчикВторой = Выборка.ГрузчикВторой;
	Объект.НачальныйПробег = Выборка.НачальныйПробег;

КонецПроцедуры

#КонецОбласти
