
#Область ПрограммныйИнтерфейс
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
 
Процедура Печать(ТабДок, Ссылка) Экспорт
	
	Макет = ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ЗаявкаНаТранспорт.Номер КАК Номер,
	|	ЗаявкаНаТранспорт.Дата КАК Дата,
	|	ЗаявкаНаТранспорт.Контрагент КАК Контрагент,
	|	ЗаявкаНаТранспорт.КонтактноеЛицо КАК КонтактноеЛицо,
	|	ЗаявкаНаТранспорт.КонтактноеЛицо.Адрес КАК Адрес,
	|	ЗаявкаНаТранспорт.КонтактноеЛицо.Телефон КАК Телефон,
	|	ЗаявкаНаТранспорт.ДатаДоставки КАК ДатаДоставки,
	|	ЗаявкаНаТранспорт.Транспорт КАК Транспорт,
	|	ЗаявкаНаТранспорт.Водитель КАК Водитель,
	|	ЗаявкаНаТранспорт.ГрузчикВторой КАК ГрузчикВторой,
	|	ЗаявкаНаТранспорт.ГрузчикПервый КАК ГрузчикПервый,
	|	ЗаявкаНаТранспорт.Основание.Товары.(
	|		НомерСтроки КАК НомерСтроки,
	|		Номенклатура КАК Номенклатура,
	|		Количество КАК Количество,
	|		ЕдиницаИзмерения КАК ЕдиницаИзмерения) КАК Основание
	|ИЗ
	|	Документ.ЗаявкаНаТранспорт КАК ЗаявкаНаТранспорт
	|ГДЕ
	|	ЗаявкаНаТранспорт.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьТоварыШапка = Макет.ПолучитьОбласть("ТоварыШапка");
	ОбластьТовары = Макет.ПолучитьОбласть("Товары");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;
		
		ОбластьЗаголовок.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());
		
		ТабДок.Вывести(ОбластьТоварыШапка);
		ВыборкаТовары = Выборка.Основание.Выбрать();

		Пока ВыборкаТовары.Следующий() Цикл
			ОбластьТовары.Параметры.Заполнить(ВыборкаТовары);
			ТабДок.Вывести(ОбластьТовары, ВыборкаТовары.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;

КонецПроцедуры

#КонецЕсли	
#КонецОбласти