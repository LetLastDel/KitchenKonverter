//
//  ProductModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.04.2023.
//

import Foundation
import RealmSwift
class ProductModel: Object, Identifiable {
    
    @Persisted(primaryKey: false) var id: String
    @Persisted var title: String
    @Persisted var density: Double
    
    convenience init(title: String, density: Double) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.density = density
    }
}

