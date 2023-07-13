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
        TabView{
            MainView()
                .tabItem{
                    Image(systemName: "scalemass.fill")
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
                DefaultMeasure.shared.add()
                DefaultProduct.shared.add()
                viewModel.firstLoad = false
            }
            DefaultProduct.shared.getProductsListDB()
            DefaultMeasure.shared.getMeasureListDB()
           // print(RealmService.shared.config.fileURL)
        }
    }
} 
