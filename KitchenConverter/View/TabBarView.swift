//
//  TabBarView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 21.04.2023.
//

import SwiftUI
struct TabBarView: View {
    var viewModel: TabBarViewModel
    var body: some View {
        //Создаем табБар
        TabView{
            //Здесь путь к вьюхе
            MainView()
                .tabItem{
                    //Картинка
                    Image(systemName: "scalemass.fill")
                    //Название
                    Text("Конвертер")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Настройки")
                }
        }
        .onAppear{
            if viewModel.firstLoad == true{
                DefaultMeasure.deflMeasur.add()
                DefaultProduct.deflProduct.add()
                viewModel.firstLoad = false
            }
            //Вызвали функцию приема информации о продуктах из ДБ
            DefaultProduct.deflProduct.getProductsListDB()
            //Вызываем функцию приема информации о мерах измерений из ДБ
            DefaultMeasure.deflMeasur.getMeasureListDB()
            //А это ссылка для РеалмСтудио
           // print(RealmService.shared.config.fileURL)
        }

    }
    
} 
