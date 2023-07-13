//
//  AddProductViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 14.04.2023.
//

import Foundation

class AddProductViewModel: ObservableObject {
    
    //текстфилды из аддПродуктВью
    @Published var productTitle: String = ""
    @Published var density: String = ""

    //Создали фунцию добавления продукта
    func addProduct(){
        //Создали сам продукт, заполнив его из Паблишет свойств
        let product = Product(title: productTitle,
                              density: Double(density)!)
        //Отправили его в функцию в Реалме
        RealmService.shared.addProduct(product: product)
    }
}
