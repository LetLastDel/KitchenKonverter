
//
//  ContentView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 11.04.2023.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @ObservedObject var defaultMeasure = DefaultMeasure.deflMeasur
    @ObservedObject var defaultProduct = DefaultProduct.deflProduct
    
    @State var addProductScreen = false
    @State var addMeasureScreen = false
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    TextField("Количество", text: $viewModel.quantity)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(.white.opacity(0.85))
                        .cornerRadius(15)
                        .padding(.horizontal, 2)
                    Picker("", selection: $viewModel.unitsOne){
                        //Из-за вылета приложухи при удалении элементов из ДБ надо ходить по индексу массива и тогда все норм работает
                        ForEach(0 ..< DefaultMeasure.deflMeasur.measure.count, id: \.self) { index in
                            Text(DefaultMeasure.deflMeasur.measure[index].measureTitle)
                                .tag(DefaultMeasure.deflMeasur.measure[index])
                        }
                    }
                    .tint(.black)
                    .frame(width: 140, height: 50)
                    .background(.white.opacity(0.8))
                    .cornerRadius(15)
                }
                HStack {
                    Text(String(viewModel.calculated))
                        .frame(width: 230, height: 50)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.3))
                        .cornerRadius(13)
                        .padding(.horizontal, 2)
                    Picker("", selection: $viewModel.unitsTwo){
                        ForEach(0 ..< DefaultMeasure.deflMeasur.measure.count, id: \.self) { index in
                            Text(DefaultMeasure.deflMeasur.measure[index].measureTitle)
                                .tag(DefaultMeasure.deflMeasur.measure[index])
                        }
                    }
                    .tint(.black)
                    .frame(width: 140, height: 50)
                    .background(.black.opacity(0.5))
                    .cornerRadius(15)                }
                HStack{
                    Button("+"){
                        addProductScreen.toggle()
                    }
                    .fullScreenCover(isPresented: $addProductScreen){
                        NavigationView { AddProductView() }
                        //(1) Продолжение настройки передачи данных из одной вью в другую, добавили модификатор наблюдаемого объект Дальше смотри снова АддПродукт в районе кнопки сохранить
                            .environmentObject(viewModel)
                    }
                    .bold()
                    .tint(.black)
                    .frame(width: 40, height: 100)
                    .background(.black.opacity(0.3))
                    .cornerRadius(15)
                    Picker("", selection: $viewModel.selectedProduct){
                        ForEach(0 ..< DefaultProduct.deflProduct.products.count, id: \.self) { index in
                            Text(DefaultProduct.deflProduct.products[index].title)
                                .tag(DefaultProduct.deflProduct.products[index])
                        }.foregroundColor(.white)
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 280, height: 100)
                    .background(.black.opacity(0.3))
                    .cornerRadius(20)
                    Button("+"){
                        addMeasureScreen.toggle()
                    }
                    .fullScreenCover(isPresented: $addMeasureScreen){
                        NavigationView { AddMeasureView() }
                        //(1) Продолжение настройки передачи данных из одной вью в другую, добавили модификатор наблюдаемого объекта Дальше снова АддМежер в районе кнопки сохранить
                            .environmentObject(viewModel)
                    }
                    .bold()
                    .tint(.black)
                    .frame(width: 40, height: 100)
                    .background(.black.opacity(0.3))
                    .cornerRadius(15)
                }
                Button("Посчитать") {
                    viewModel.converterUnit()
                }
                .foregroundColor(.black)
                .frame(width: 370, height: 50)
                .background(.green)
                .cornerRadius(15)
                .padding(.vertical, 5)
                Button("Запомнить") {
                    viewModel.saveInTable()
                }
                .foregroundColor(.black)
                .frame(width: 370, height: 50)
                .background(.yellow)
                .cornerRadius(15)
                if viewModel.saved.isEmpty{
                    Spacer()
                    Text("Сохраните свои расчеты!")
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.saved, id: \.self) { sav in
                            HStack {
                                Text(String(format: "%.2f",sav.inQua))
                                Text(sav.inMeasure)
                                Text(sav.product)
                                Spacer()
                                Text(String(format: "%.3f", sav.quantity, sav.measure))
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button("Удалить") {
                                    if let index = viewModel.saved.firstIndex(of: sav) {
                                        viewModel.saved.remove(at: index)
                                    }
                                }
                                .tint(.red)
                            }
                        }
                    }
                    .cornerRadius(30)
                    .listStyle(.inset)
                    .padding(10)
                }
        }
            .onAppear{
                //Вызвали функцию приема информации о продуктах из ДБ
                DefaultProduct.deflProduct.getProductsListDB()
                //Вызываем функцию приема информации о мерах измерений из ДБ
                DefaultMeasure.deflMeasur.getMeasureListDB()
                //А это ссылка для РеалмСтудио
               // print(RealmService.shared.config.fileURL)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.green, .yellow, .orange, .pink, .red, .purple, .teal, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
