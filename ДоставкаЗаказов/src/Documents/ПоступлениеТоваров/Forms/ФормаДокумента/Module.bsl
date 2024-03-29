#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ОбщегоНазначенияКлиент.ПересчетСтрокиДокумента(Элементы.Товары.ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)
	
	ТекущаяСтрока 		= Элементы.Товары.ТекущиеДанные;
	ТекущаяСтрока.Цена 	= ОбщегоНазначенияВызовСервера.ПолучитьЦенуПокупкиНоменклатуры(Объект.Дата, Объект.Контрагент, ТекущаяСтрока.Номенклатура);
	ОбщегоНазначенияКлиент.ПересчетСтрокиДокумента(ТекущаяСтрока);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ОбщегоНазначенияКлиент.ПересчетСтрокиДокумента(Элементы.Товары.ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти
