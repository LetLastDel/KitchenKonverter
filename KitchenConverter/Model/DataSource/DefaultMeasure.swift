//
//  DefaultMeasure.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 15.04.2023.
//

import Foundation
class DefaultMeasure: ObservableObject {
    //Сингл тон, во всем приложении будет только единственный экземпляр этого класса
    static var deflMeasur = DefaultMeasure(); private init() { }
    
    @Published var measure: [MeasureModel] = []
    @Published var firstLoadMeasure: [MeasureModel] = [
        MeasureModel(measureTitle: "Килограмм", weight: 1000, bulkType: "Масса"),
        MeasureModel(measureTitle: "Грамм", weight: 1, bulkType: "Масса"),
        MeasureModel(measureTitle: "Литр", weight: 1000, bulkType: "Объем"),
        MeasureModel(measureTitle: "Миллилитр", weight: 1, bulkType: "Объем"),
        MeasureModel(measureTitle: "Стакан", weight: 250, bulkType: "Объем")
    ]
    //первичное заполнение базы
    func add(){
        for measure in firstLoadMeasure{
            RealmService.shared.addMeasurment(measure: measure)
        }
    }
    
    //Функция получения списка продуктов, в данном случае уже к имеющимся продуктам добавляем массив, полученный из ДБ
    func getMeasureListDB(){
        measure = RealmService.shared.getMeasures()
    }
}

