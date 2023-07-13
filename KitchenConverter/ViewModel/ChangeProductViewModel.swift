//
//  ChangeProductViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 22.04.2023.
//

import Foundation

class ChangeProductViewModel: ObservableObject {
    
    @Published var productTitle: String = ""
    @Published var density: String = ""
    var product: Product
    
    init(product: Product) {
        self.productTitle = product.title
        self.density = String(product.density)
        self.product = product
    }
    //Создали фунцию изменения продукта, пульнем его в реалм со свойствами и там поменяем
    func changeProduct(){
        RealmService.shared.changeProduct(product, name: productTitle, dens: Double(density)!)
    }
    //Создали метод удаления продукта
    func deleteProduct(){
        if DefaultProduct.deflProduct.products.count > 1{
            RealmService.shared.deleteProduct(product)
        }
    }
}
