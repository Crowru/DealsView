//
//  Sorting.swift
//  DealsViewer
//
//  Created by Руслан  on 19.04.2024.
//

import Foundation

enum TypesOrder: String {
    case dateModifier = "Дата изменения сделки"
    case instrument = "Имя инструмента"
    case price = "Цена сделки"
    case amount = "Объем сделки"
    case side = "Сторона сделки"
}

enum SortOrder {
    case lessToMore
    case moreToLess
}
