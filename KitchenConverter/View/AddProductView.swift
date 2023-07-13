//
//  AddProductView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 14.04.2023.
//

import SwiftUI

struct AddProductView: View {
    @StateObject var viewModel = AddProductViewModel()
    @Environment(\.presentationMode) var presentationMode
    //(1) Это мы делаем чтобы из одной вью передавалась информация в другую. При добавлении единицы измерения маинВью должна будет обновиться и показать сразу все.  Остальное написано во МаинВью В районе кнопок добавления продуктов и единиц
    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text("Добавьте свой ингридиент!").bold()
                        .padding()
                    TextField("Введите название", text: $viewModel.productTitle)
                        .padding()
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    TextField("Введите плотность", text: $viewModel.density)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                }
                .padding()

                Button("OK") {
                    guard Double(viewModel.density) != nil else { return }
                    viewModel.addProduct()
                    presentationMode.wrappedValue.dismiss()
                    //(1) Передаем во вью, что надо запустить метод обновления
                    mainViewModel.updateProductPicker()
                }
                .frame(width: 300, height: 80)
                .tint(.black)
                .background(.purple.opacity(0.4))
                .cornerRadius(20)
                Button("Отмена"){
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 300, height: 50)
                .tint(.black)
                .background(.red.opacity(0.4))
                .cornerRadius(20)
                .padding()
            }.background(.white.opacity(0.5))
                .cornerRadius(20)
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.green, .yellow, .orange, .pink, .red, .purple, .teal, .accentColor], startPoint: .topTrailing, endPoint: .bottomLeading))
    }
}
struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
