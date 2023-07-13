//
//  ProductModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.04.2023.
//

import Foundation
//Импортировали Реалм
import RealmSwift
//Подписали класс под Обжект
class Product: Object, Identifiable {
    
//Реалм требует обертку @Persisted. Для айди еще требует указание первичного ключа
    @Persisted(primaryKey: false) var id: String
    @Persisted var title: String
    @Persisted var density: Double
    
    //Так же, конвиенц инит требует
    convenience init(title: String, density: Double) {
        //и селф инит
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.density = density
    }
}

