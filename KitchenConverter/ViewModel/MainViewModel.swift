//
//  MainViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 14.04.2023.
//

import Foundation
//Наблюдаемая модель, к которой обращается маинВью
class MainViewModel: ObservableObject {

//Все наблюдаемые свойства, с которыми мы общаемся в интерфейсе
    @Published var quantity: String = ""
    @Published var unitsOne: MeasureModel = DefaultMeasure.deflMeasur.measure[0]
    @Published var unitsTwo: MeasureModel = DefaultMeasure.deflMeasur.measure[0]
    @Published var calculated: Double = 0.0
    @Published var resultat: String = ""
    @Published var products: String = ""
    @Published var saved: [PositionModel] = []
    
    @Published var selectedProduct: Product = DefaultProduct.deflProduct.products.first!
    //(1)Вот эти функции попросят модели обновить свои массивы
    func updateProductPicker(){
        DefaultProduct.deflProduct.getProductsListDB()
    }
    func updateMeasurePicker(){
        DefaultMeasure.deflMeasur.getMeasureListDB()
    }
    //Сохраняем в таблицу
    func saveInTable(){
        guard let quantity = Double(quantity) else { return }
        let newPosition = PositionModel(inQua: quantity,
                                        inMeasure: unitsOne.measureTitle,
                                        product: selectedProduct.title,
                                        quantity: calculated,
                                        measure: unitsTwo.measureTitle)
        saved.append(newPosition)
    }
    
    func converterUnit(){
        guard let quantity = Double(quantity) else { return }
        switch (unitsOne.bulkType, unitsTwo.bulkType) {
        case ("Масса", "Масса"):
            calculated = quantity * unitsOne.weight / unitsTwo.weight
        case ("Объем", "Объем"):
            calculated = quantity * unitsOne.weight / unitsTwo.weight
        case ("Масса", "Объем"):
            calculated = quantity / selectedProduct.density * unitsOne.weight / unitsTwo.weight
        case ("Объем", "Масса"):
            calculated = quantity * selectedProduct.density * unitsOne.weight / unitsTwo.weight
        default:
            break
        }        
        self.resultat = "\(calculated)"
    }
}
