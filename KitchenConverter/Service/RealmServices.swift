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
    //Работаем с продуктами
    //Добавляем их в продукты
    func addProduct(product: Product) {
        do{
            try dbProduct.write{
                dbProduct.add(product)
            }
        } catch {
            print("Ингридиент не записался")
        }
    }
    //Получаем их в список через массив
    func getProduct() -> [Product]{
        //Получили Резалт<продукты>
        let products = dbProduct.objects(Product.self)
        //Объявили массив типа Продуксты
        var product = [Product]()
        //Замыканием каждую позицию из products добавили в массив product
        for prod in products{
            product.append(prod)
        }
        //Вернули продукт, который потом получим в списке продуктов во вью
        return product
    }
    
    //Удаление из базы, на данный момент вылетает
    func deleteProduct(_ product: Product){
        //Через отлов ошибок do-catch производим запись
        do{
            //Вот здесь
            try dbProduct.write{
                //Производим удаление продукта
                dbProduct.delete(product)
            //    getProduct()
            }
            //Если не срабатывает, то ловим принт ошибки
        } catch {
            print("Ингридиент не удалился")
        }
    }
    
    //Изменение продуктов
    func changeProduct(_ product: Product, name: String, dens: Double){
        do{
            try dbProduct.write{
                product.title = name
                product.density = dens
            //    getProduct()
            }
        } catch {
            print("Очередной косяк")
        }
    }
    
    
    
    
    //Работаем с единицами измерений
    //Добавляем новые единицы измерений
    func addMeasurment(measure: MeasureModel){
        do{
            try dbMeasure.write{
                dbMeasure.add(measure)
           //     getProduct()
            }
        } catch {
            print("Единица измерений не добавилась")
        }
    }
    //Получаем единицы измерений из БД
    //Выше есть полное описание как это делается
    func getMeasures() -> [MeasureModel]{
        let measures = dbMeasure.objects(MeasureModel.self)
        var measur = [MeasureModel]()
        for meas in measures{
            measur.append(meas)
        }
        return measur
    }
    //Удаление единицы измерений из БД
    func deleteMeasures(_ measure: MeasureModel){
        do{
            try dbMeasure.write{
                dbMeasure.delete(measure)
            //    getMeasures()
            }
        } catch {
            print("Единица измерений не удалилась")
        }
    }
    //Изменение единицы измерений в БД
    func changeMeasure(_ measure: MeasureModel, titl: String, wg: Double, bulk: String){
        do {
            print(measure)
            try dbMeasure.write{
                measure.measureTitle = titl
                measure.weight = wg
                measure.bulkType = bulk
             //   getMeasures()
                
            }
        } catch {
            print("Drop")
        }
    }
}
