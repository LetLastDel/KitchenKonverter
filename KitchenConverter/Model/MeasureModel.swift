//
//  MeasureModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 15.04.2023.
//

import Foundation
//Импортировали Реалм

import RealmSwift
//Подписали класс под Обжект

class MeasureModel: Object , Identifiable {
    //Реалм требует обертку @Persisted. Для айди еще требует указание первичного ключа

    @Persisted(primaryKey: true) var id: String
    @Persisted var measureTitle: String
    @Persisted var weight: Double
    @Persisted var bulkType: String
    
    //Так же, конвиенц инит требует
   convenience init(measureTitle: String, weight: Double, bulkType: String) {
       //и селф инит
       self.init()
       self.id = UUID().uuidString
        self.measureTitle = measureTitle
        self.weight = weight
        self.bulkType = bulkType
     }
}

