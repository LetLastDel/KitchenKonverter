//
//  AddMeasureView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 15.04.2023.
//

import SwiftUI

struct AddMeasureView: View {
    
    @StateObject var viewModel = AddMeasureViewModel()
    @Environment(\.presentationMode) var presentationMode
    //(1)    Это мы делаем чтобы из одной вью передавалась информация в другую. При добавлении единицы измерения маинВью должна будет обновиться и показать сразу все.  Остальное написано во МаинВью  (1) В районе кнопок добавления продуктов и единиц
    @EnvironmentObject var mainViewModel: MainViewModel

    
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text("Добавьте свою меру измерений!").bold()
                        .padding()
                    Text("Например: ложка столовая").font(.system(size: 12)).padding(.trailing, +150).opacity(0.5)
                    TextField("Введите название", text: $viewModel.measureTitle)
                        .padding()
                        .background(.white.opacity(0.5))

                        .cornerRadius(20)
                    Text("Например: 5 грамм").font(.system(size: 12)).padding(.trailing, +190).opacity(0.5)
                    TextField("Введите граммы", text: $viewModel.measureGramm)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                }
                Picker("", selection: $viewModel.measureBulk) {
                    Text("Масса").tag("Масса")
                    Text("Объем").tag("Объем")
                }.pickerStyle(.segmented)
                    .padding()
                Button("OK") {
                    guard Double(viewModel.measureGramm) != nil else { return }
                    viewModel.addMeasure()
                    //(1) Передаем во вью, что надо запустить метод обновления
                    mainViewModel.updateMeasurePicker()
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
            }
        }
        .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.green, .yellow, .orange, .pink, .red, .purple, .teal, .accentColor], startPoint: .bottomLeading, endPoint: .topTrailing))
    }
}

struct AddMeasureView_Previews: PreviewProvider {
    static var previews: some View {
        AddMeasureView()
    }
}
