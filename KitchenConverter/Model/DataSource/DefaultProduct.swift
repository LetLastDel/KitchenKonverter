//
//  DefaultProduct.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 14.04.2023.
//


import Foundation

class DefaultProduct: ObservableObject {
    //Сингл тон, во всем приложении будет только единственный экземпляр этого класса
    static var deflProduct = DefaultProduct(); private init() { }
    
    @Published var products: [Product] = []
    @Published var firstLoadProduct: [Product] = [
        Product(title: "Вода", density: 1),
        Product(title: "Гречка", density: 0.71),
        Product(title: "Рис", density: 0.78),
        Product(title: "Масло", density: 0.96)
    ]
    
    //Первичное заполнение базы
    func add(){
        for prod in firstLoadProduct{
            RealmService.shared.addProduct(product: prod)
        }
    }
    //Функция получения списка продуктов
    func getProductsListDB(){
        products = RealmService.shared.getProduct()
    }
}

