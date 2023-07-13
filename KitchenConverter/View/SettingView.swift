//
//  SettingView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 21.04.2023.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject var viewModel = SettingViewModel()
    @ObservedObject var defaultMeasure = DefaultMeasure.deflMeasur
    @ObservedObject var defaultProduct = DefaultProduct.deflProduct
    
    
    var body: some View {
        List{
            Section("Ингридиенты:"){
                ForEach(0 ..< DefaultProduct.deflProduct.products.count, id: \.self) { index in
                    NavigationLink{
                        ChangeProductView(viewModel: ChangeProductViewModel(product: DefaultProduct.deflProduct.products[index]))
                            .environmentObject(SettingViewModel())
                    } label: {
                        HStack{
                            Text(DefaultProduct.deflProduct.products[index].title)
                            Spacer()
                            Text("Плотность:  " + String(format: "%.3f", DefaultProduct.deflProduct.products[index].density))
                        }
                    }
                }
            }
            Section("Единицы измерений:"){
                ForEach(0 ..< DefaultMeasure.deflMeasur.measure.count, id: \.self) { index in
                    NavigationLink {
                        ChangeMeasureView(viewModel: ChangeMeasureViewModel(measure: DefaultMeasure.deflMeasur.measure[index]), measure: DefaultMeasure.deflMeasur.measure[index])
                            .environmentObject(SettingViewModel())
                    } label: {
                        HStack{
                            Text(DefaultMeasure.deflMeasur.measure[index].measureTitle)
                            Spacer()
                            if DefaultMeasure.deflMeasur.measure[index].bulkType == "Масса"{
                                Text(String(format: "%.1f", (DefaultMeasure.deflMeasur.measure[index].weight)) + " Гр")
                            } else {
                                Text(String(format: "%.1f", (DefaultMeasure.deflMeasur.measure[index].weight)) + " Мл")
                            }
                            Text(DefaultMeasure.deflMeasur.measure[index].bulkType)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }.onAppear{
            viewModel.updateMeasureTable()
            viewModel.updateProductTable()
        }
    }
}
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
