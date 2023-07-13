//
//  SettingView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 21.04.2023.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject var viewModel = SettingViewModel()
    @ObservedObject var defaultMeasure = DefaultMeasure.shared
    @ObservedObject var defaultProduct = DefaultProduct.shared
    
    var body: some View {
        List{
            Section("Ингридиенты:"){
                ForEach(0 ..< DefaultProduct.shared.products.count, id: \.self) { index in
                    NavigationLink{
                        ChangeItemView(viewModel: ChangeItemViewModel(product: DefaultProduct.shared.products[index]), check: false)
                            .environmentObject(SettingViewModel())
                    } label: {
                        HStack{
                            Text(DefaultProduct.shared.products[index].title)
                            Spacer()
                            Text("Плотность:  " + String(format: "%.3f", DefaultProduct.shared.products[index].density))
                        }
                    }
                }
            }
            Section("Единицы измерений:"){
                ForEach(0 ..< DefaultMeasure.shared.measure.count, id: \.self) { index in
                    NavigationLink {
                        ChangeItemView(viewModel: ChangeItemViewModel(measure: DefaultMeasure.shared.measure[index]), check: true)
                            .environmentObject(SettingViewModel())
                    } label: {
                        HStack{
                            Text(DefaultMeasure.shared.measure[index].measureTitle)
                            Spacer()
                            if DefaultMeasure.shared.measure[index].bulkType == "Масса"{
                                Text(String(format: "%.1f", (DefaultMeasure.shared.measure[index].weight)) + " Гр")
                            } else {
                                Text(String(format: "%.1f", (DefaultMeasure.shared.measure[index].weight)) + " Мл")
                            }
                            Text(DefaultMeasure.shared.measure[index].bulkType)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .onAppear{
            viewModel.updateMeasureTable()
            viewModel.updateProductTable()
        }
    }
}
//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
