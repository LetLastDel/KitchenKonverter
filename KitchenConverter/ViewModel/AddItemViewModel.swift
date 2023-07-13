//
//  ItemViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import Foundation

class AddItemViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var density: String = ""
    @Published var measureGramm: String = ""
    @Published var measureBulk: String = ""
    
    
    func addProduct(){
        let product = ProductModel(title: title,
                              density: Double(density)!)
        RealmService.shared.addProduct(product: product)
    }

    func addMeasure(){
        let measure = MeasureModel(measureTitle: title,
                                   weight: Double(measureGramm)!,
                                   bulkType: measureBulk)
        RealmService.shared.addMeasurment(measure: measure)
    }
}
