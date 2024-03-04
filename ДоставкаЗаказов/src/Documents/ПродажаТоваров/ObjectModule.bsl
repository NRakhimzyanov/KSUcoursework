#Область ОбработчикиСобытий
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
	
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	СуммаДокумента = Товары.Итог("Сумма");
	
	Если НЕ ЗначениеЗаполнено(Контрагент) Тогда
		Текст = "Поле Контрагент должно быть заполнено";
		ОбщегоНазначенияВызовСервера.СообщениеПользователюСервер(Текст);
		Отказ = Истина;
	КонецЕсли;	
	
	Если НЕ ЗначениеЗаполнено(КонтактноеЛицо) Тогда
		Текст = "Поле КонтактноеЛицо должно быть заполнено";
		ОбщегоНазначенияВызовСервера.СообщениеПользователюСервер(Текст);
		Отказ = Истина;
	КонецЕсли;	
		
	Если НЕ ЗначениеЗаполнено(Сотрудник)  Тогда
		Текст = "Поле Сотрудник должно быть заполнено";
		ОбщегоНазначенияВызовСервера.СообщениеПользователюСервер(Текст);
		Отказ = Истина;
	КонецЕсли;	
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)

	Движения.ОстаткиНоменклатуры.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ОстаткиНоменклатуры.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Склад = Склад;		
		ЗаполнитьЗначенияСвойств(Движение, ТекСтрокаТовары);
	КонецЦикла;

	Движения.Продажи.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		Движение.Контрагент = Контрагент;
		ЗаполнитьЗначенияСвойств(Движение, ТекСтрокаТовары);
	КонецЦикла;

	Движения.Продажи.Записывать = Истина;
	Для Каждого ТекСтрокаУслуги Из Услуги Цикл
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		ЗаполнитьЗначенияСвойств(Движение, ТекСтрокаУслуги);
	КонецЦикла;

КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)

	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ПоступлениеТоваров") Тогда
		
		Запрос = Новый Запрос;
		Запрос.Текст =
			"ВЫБРАТЬ
			|	ПоступлениеТоваровТовары.Ссылка.Контрагент,
			|	ПоступлениеТоваровТовары.Ссылка.КонтактноеЛицо,
			|	ПоступлениеТоваровТовары.Ссылка.Сотрудник,
			|	ПоступлениеТоваровТовары.Ссылка.Склад,
			|	ПоступлениеТоваровТовары.Ссылка.СуммаДокумента,
			|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
			|	ПоступлениеТоваровТовары.Серия КАК Серия,
			|	ПоступлениеТоваровТовары.Количество КАК Количество,
			|	ПоступлениеТоваровТовары.Цена КАК Цена,
			|	ПоступлениеТоваровТовары.Сумма КАК Сумма,
			|	ПоступлениеТоваровТовары.ЕдиницаИзмерения КАК ЕдиницаИзмерения
			|ИЗ
			|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
			|ГДЕ
			|	ПоступлениеТоваровТовары.Ссылка = &Ссылка";
		
		Запрос.УстановитьПараметр("Ссылка", ДанныеЗаполнения);
		РезультатЗапроса = Запрос.Выполнить();
		
		Если РезультатЗапроса.Пустой() Тогда
		
			Возврат;
		
		КонецЕсли;
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл; 
			НоваяСтрока = Товары.Добавить();
			ЗаполнитьЗначенияСвойств(НоваяСтрока, ВыборкаДетальныеЗаписи);
		КонецЦикла;
		
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, ВыборкаДетальныеЗаписи);
		
	КонецЕсли;
КонецПроцедуры

#Иначе
  ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли
#КонецОбласти
