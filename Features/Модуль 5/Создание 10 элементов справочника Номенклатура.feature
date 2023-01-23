#language: ru

@tree

Функционал: создание 10 элементов справочника Номенклатура с разными наименованиями без дополнительных реквизитов

Как Тестировщик я хочу
создать 10 элементов справочника Номенклатура с разными наименованиями без дополнительных реквизитов
чтобы выполнить практическое задание 1 к Модулю 5

Сценарий: создание 10 элементов справочника Номенклатура
	И я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И я запоминаю значение выражения '"Номенклатура № " + $Шаг$' в переменную "НаименованиеНоменклатуры"
		// Справочник.ItemTypes
		И я проверяю или создаю для справочника "ItemTypes" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Parent' | 'IsFolder' | 'Code' | 'Type'                   | 'UseSerialLotNumber' | 'Description_en'            | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'UniqueID'                          |
			| 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'False'        | ''       | 'False'    | 2      | 'Enum.ItemTypes.Product' | 'False'              | 'Товар (без характеристик)' | ''                 | ''               | ''               | '_32c63d8e5ee94926b3c772ab02c5243e' |

		// Справочник.Partners
		И я проверяю или создаю для справочника "Partners" объекты:
			| 'Ref'                                                              | 'DeletionMark' | 'Parent' | 'Code' | 'Customer' | 'Vendor' | 'Employee' | 'Opponent' | 'ManagerSegment' | 'Description_en'             | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | 'False'        | ''       | 3      | 'False'    | 'True'   | 'False'    | 'False'    | ''               | 'Поставщик 1 (1 соглашение)' | ''                 | ''               | ''               |

		// Справочник.Units
		И я проверяю или создаю для справочника "Units" объекты:
			| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'False'        |        | ''     | 1          | ''          | ''    | 'шт'             | ''                 | ''               | ''               |          |          |          |          |         |
		// Справочник.Items
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture' | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'             | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | ''             | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58792'  | ''            | '$НаименованиеНоменклатуры$' | ''                 | ''               | ''               |          |          |          |          |         |