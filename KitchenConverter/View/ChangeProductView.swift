//
//  ChangeProductView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 22.04.2023.
//

import SwiftUI

struct ChangeProductView: View {
    @StateObject var viewModel = ChangeProductViewModel(product: Product())
    @Environment(\.presentationMode) var presentationMode
    //(1) Это мы делаем чтобы из одной вью передавалась информация в другую. При добавлении единицы измерения маинВью должна будет обновиться и показать сразу все.  Остальное написано во МаинВью В районе кнопок добавления продуктов и единиц
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var setingViewModel: SettingViewModel

    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text("Внесите изменения").bold()
                        .padding()
                    TextField("", text: $viewModel.productTitle)
                        .padding()
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    TextField("", text: $viewModel.density)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                }
                .padding()
                Button("OK") {
                    guard Double(viewModel.density) != nil else { return }
                    viewModel.changeProduct()
                    setingViewModel.updateProductTable()
                    presentationMode.wrappedValue.dismiss()
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
                Button("Удалить"){
                    viewModel.deleteProduct()
                    setingViewModel.updateProductTable()
                    presentationMode.wrappedValue.dismiss()
                }.frame(width: 300, height: 20)
                    .tint(.black)
                    .background(.red.opacity(0.4))
                    .cornerRadius(20)
                    .padding()
            }.background(.white.opacity(0.5))
                .cornerRadius(20)
        }
        .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.green, .yellow, .orange, .pink, .red, .purple, .teal, .accentColor], startPoint: .topTrailing, endPoint: .bottomLeading))
    }
}

struct ChangeProductView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProductView()
    }
}
