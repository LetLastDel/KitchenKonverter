//
//  MeasureModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 15.04.2023.
//

import Foundation
import RealmSwift

class MeasureModel: Object , Identifiable {

    @Persisted(primaryKey: true) var id: String
    @Persisted var measureTitle: String
    @Persisted var weight: Double
    @Persisted var bulkType: String
    
   convenience init(measureTitle: String, weight: Double, bulkType: String) {
       self.init()
       self.id = UUID().uuidString
        self.measureTitle = measureTitle
        self.weight = weight
        self.bulkType = bulkType
     }
}

