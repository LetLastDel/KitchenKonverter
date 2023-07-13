//
//  ChangeItemViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import Foundation

class ChangeItemViewModel: ObservableObject {
    @Published var title: String
    @Published var measureGramm: String
    @Published var measureBulk: String
    @Published var density: String
    
    var measure: MeasureModel?
    var product: ProductModel?
    
    init(measure: MeasureModel) {
        self.title = measure.measureTitle
        self.measureGramm = String(measure.weight)
        self.measureBulk = measure.bulkType
        self.measure = measure
        self.density = ""
    }
    init(product: ProductModel) {
        self.title = product.title
        self.density = String(product.density)
        self.measureGramm = ""
        self.measureBulk = ""
        self.product = product
    }
    
    func delete() {
        if let measure = self.measure{
            if DefaultMeasure.shared.measure.count > 1{
                RealmService.shared.deleteMeasures(measure)
            }
        }
        else if let product = self.product{
            if DefaultProduct.shared.products.count > 1{
                RealmService.shared.deleteProduct(product)
            }
        }
    }
        func change(){
            if let measure = self.measure{
                RealmService.shared.changeMeasure(measure, titl: title, wg: Double(measureGramm)!, bulk: measureBulk)
                
            } else if let product = self.product {
                RealmService.shared.changeProduct(product, name: title, dens: Double(density)!)
            }
        }
    }
