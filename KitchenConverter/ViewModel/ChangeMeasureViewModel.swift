//
//  ChangeMeasureViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 21.04.2023.
//
import SwiftUI

class ChangeMeasureViewModel: ObservableObject {
    
    @Published var measureTitle: String
    @Published var measureGramm: String
    @Published var measureBulk: String
    var measure: MeasureModel
    
    
    init(measure: MeasureModel) {
        self.measureTitle = measure.measureTitle
        self.measureGramm = String(measure.weight)
        self.measureBulk = measure.bulkType
        self.measure = measure
    }
    
    func changeMeasure(){
        RealmService.shared.changeMeasure(measure, titl: measureTitle, wg: Double(measureGramm)!, bulk: measureBulk)
    }
    func deleteMeasure() {
        if DefaultMeasure.deflMeasur.measure.count > 1{
            RealmService.shared.deleteMeasures(measure)
        }
    }
}

