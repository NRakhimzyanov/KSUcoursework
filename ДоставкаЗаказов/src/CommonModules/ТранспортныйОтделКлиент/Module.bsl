#Область ПрограммныйИнтерфейс

// Обработка открытия формы выбора - открывает Форму выбора по заданной структуре отбора.
// 
// Параметры:
// НаименованиеСтруктуры - Структура
// ФормаВыбора - Форма
// ЭлементФормы - ПолеФормы
// ПараметрОтбора - Структура
Процедура ОткрытьФормуВыбора(НаименованиеСтруктуры, ФормаВыбора, ЭлементФормы, ПараметрОтбора) Экспорт
	
    ПараметрыОтбора = Новый Структура;
    ПараметрыОтбора.Вставить(ПараметрОтбора, НаименованиеСтруктуры);
    
    СтруктураПараметров = Новый Структура;
	СтруктураПараметров.Вставить("Отбор", ПараметрыОтбора);
	СтруктураПараметров.Вставить("РежимВыбора", Истина); 

    ОткрытьФорму(ФормаВыбора, СтруктураПараметров, ЭлементФормы);
    
КонецПроцедуры

#КонецОбласти
