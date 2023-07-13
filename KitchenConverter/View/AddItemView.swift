//
//  AddItemView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import SwiftUI

struct AddItemView: View {
    @StateObject var viewModel = AddItemViewModel()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mainViewModel: MainViewModel
    var item: Bool
    
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text(item ? "Добавьте свой ингридиент!" : "Добавьте свою меру измерений!").bold()
                        .padding()
                    TextFieldExt(title: "Введите название", text: $viewModel.title)
                    TextFieldExt(title: item ? "Введите плотность" : "Введите граммы",
                              text:item ?  $viewModel.density : $viewModel.measureGramm)
                    .keyboardType(.numberPad)
                }
                .padding()
                if !item {
                    Picker("", selection: $viewModel.measureBulk) {
                        Text("Масса").tag("Масса")
                        Text("Объем").tag("Объем")
                        
                    }.pickerStyle(.segmented)
                        .padding(18)
                }
                VStack{
                    ButtonExt(title: "ОК",
                                    action: {
                        if item {
                            guard Double(viewModel.density) != nil else { return }
                            viewModel.addProduct()
                            presentationMode.wrappedValue.dismiss()
                            mainViewModel.updateProductPicker()
                        } else {
                            guard Double(viewModel.measureGramm) != nil else { return }
                            viewModel.addMeasure()
                            mainViewModel.updateMeasurePicker()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }, color: .yellow.opacity(0.4))
                    
                    ButtonExt(title: "Отмена",
                                    action: { presentationMode.wrappedValue.dismiss()},
                                    color: .orange.opacity(0.4))
                    
                }
            }
            .background(.white.opacity(0.8))
            .cornerRadius(20)
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea())
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(item: false)
    }
}
