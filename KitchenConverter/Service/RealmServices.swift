//
//  RealmServices.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 19.04.2023.
//

import Foundation
import RealmSwift

class RealmService{
    
    static let shared = RealmService(); private init () { }
    
    private let dbProduct = try! Realm()
    private let dbMeasure = try! Realm()
    
    var config: Realm.Configuration{
        dbProduct.configuration
    }
    func addProduct(product: ProductModel) {
        do{
            try dbProduct.write{
                dbProduct.add(product)
            }
        } catch {
            print("Ингридиент не добавлен")
        }
    }
    func getProduct() -> [ProductModel]{
        let products = dbProduct.objects(ProductModel.self)
        var product = [ProductModel]()
        for prod in products{
            product.append(prod)
        }
        return product
    }
    
    func deleteProduct(_ product: ProductModel){
        do{
            try dbProduct.write{
                dbProduct.delete(product)
            }
        } catch {
            print("Ингридиент не удален")
        }
    }
    
    func changeProduct(_ product: ProductModel, name: String, dens: Double){
        do{
            try dbProduct.write{
                product.title = name
                product.density = dens
            }
        } catch {
            print("Ингридиент не изменен")
        }
    }
    
    
    func addMeasurment(measure: MeasureModel){
        do{
            try dbMeasure.write{
                dbMeasure.add(measure)
            }
        } catch {
            print("Единица измерений не добавлена")
        }
    }
    func getMeasures() -> [MeasureModel]{
        let measures = dbMeasure.objects(MeasureModel.self)
        var measur = [MeasureModel]()
        for meas in measures{
            measur.append(meas)
        }
        return measur
    }
    func deleteMeasures(_ measure: MeasureModel){
        do{
            try dbMeasure.write{
                dbMeasure.delete(measure)
            }
        } catch {
            print("Единица измерений не удалена")
        }
    }
    func changeMeasure(_ measure: MeasureModel, titl: String, wg: Double, bulk: String){
        do {
            print(measure)
            try dbMeasure.write{
                measure.measureTitle = titl
                measure.weight = wg
                measure.bulkType = bulk                
            }
        } catch {
            print("Единица измерений не изменена")
        }
    }
}
