//
//  ChangeItemView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import SwiftUI

struct ChangeItemView: View {
    @StateObject var viewModel: ChangeItemViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var settingViewModel: SettingViewModel
    var measure: MeasureModel?
    var product: ProductModel?
    var check: Bool
    
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text("Внесите изменения!").bold()
                        .padding()
                    TextFieldExt(text: $viewModel.title)
                    if check {
                        TextFieldExt(text: $viewModel.measureGramm)
                            .keyboardType(.numberPad)
                        Picker("", selection: $viewModel.measureBulk) {
                            Text("Масса").tag("Масса")
                            Text("Объем").tag("Объем")
                        }.pickerStyle(.segmented)
                            .padding()
                    } else {
                        TextFieldExt(text: $viewModel.density)
                    }
                    HStack{
                    }.padding()
                    ButtonExt(title: "OK", action: {
                        if check{
                            guard Double(viewModel.measureGramm) != nil else { return }
                            viewModel.change()
                            settingViewModel.updateMeasureTable()
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            guard Double(viewModel.density) != nil else { return }
                            viewModel.change()
                            settingViewModel.updateProductTable()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }, color: .brown.opacity(0.4))
                    ButtonExt(title: "Отмена", action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }, color: .orange.opacity(0.4))
                }.padding()
                ButtonExt(title: "Удалить", action: {
                    viewModel.delete()
                    settingViewModel.updateMeasureTable()
                    settingViewModel.updateProductTable()
                    presentationMode.wrappedValue.dismiss()
                }, color: .red, hSize: 40)
            }
            .background(.white.opacity(0.8))
            .cornerRadius(20)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea())
    }
}

struct ChangeItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeItemView(viewModel: ChangeItemViewModel(measure: MeasureModel()), measure: MeasureModel(measureTitle: "Кувшин", weight: 220, bulkType: "Масса"), check: true)
    }
}
