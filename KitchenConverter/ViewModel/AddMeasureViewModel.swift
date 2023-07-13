//
//  AddMeasureViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 15.04.2023.
//

import Foundation

class AddMeasureViewModel: ObservableObject {
    
    //Тоже это от текстфилдов в аддВью
    @Published var measureTitle: String = ""
    @Published var measureGramm: String = ""
    @Published var measureBulk: String = ""
    
    //Создали фунцию добавления продукта
    func addMeasure(){
        //Создали сам продукт, заполнив его из Паблишет свойств
        let measure = MeasureModel(measureTitle: measureTitle,
                                   weight: Double(measureGramm)!,
                                   bulkType: measureBulk)
        //Отправили его в функцию в Реалме
        RealmService.shared.addMeasurment(measure: measure)
    }
}
