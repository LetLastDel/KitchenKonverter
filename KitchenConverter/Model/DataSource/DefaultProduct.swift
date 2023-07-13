//
//  DefaultProduct.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 14.04.2023.
//


import Foundation

class DefaultProduct: ObservableObject {
    static var shared = DefaultProduct(); private init() { }
    
    @Published var products: [ProductModel] = []
    @Published var firstLoadProduct: [ProductModel] = [
        ProductModel(title: "Вода", density: 1),
        ProductModel(title: "Гречка", density: 0.71),
        ProductModel(title: "Рис", density: 0.78),
        ProductModel(title: "Масло", density: 0.96)
    ]
    func add(){
        for prod in firstLoadProduct{
            RealmService.shared.addProduct(product: prod)
        }
    }
    func getProductsListDB(){
        products = RealmService.shared.getProduct()
    }
}

