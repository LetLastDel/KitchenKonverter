
//
//  ContentView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 11.04.2023.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @ObservedObject var defaultMeasure = DefaultMeasure.shared
    @ObservedObject var defaultProduct = DefaultProduct.shared
    
    @State var addProductScreen = false
    @State var addMeasureScreen = false
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    TextField("Количество", text: $viewModel.quantity)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(.black.opacity(0.3))
                        .cornerRadius(15)
                        .padding(.horizontal, 2)
                    PickerExt(selection: $viewModel.unitsOne, content: {
                        ForEach(0 ..< DefaultMeasure.shared.measure.count, id: \.self) { index in
                            Text(DefaultMeasure.shared.measure[index].measureTitle)
                                .tag(DefaultMeasure.shared.measure[index])
                        }
                    }, frameWith: 140, frameHeight: 50, cornerRadius: 15)
                }
                HStack {
                    Text(String(viewModel.calculated))
                        .frame(width: 230, height: 50)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.3))
                        .cornerRadius(13)
                        .padding(.horizontal, 2)
                    
                    PickerExt(selection: $viewModel.unitsTwo, content: {
                        ForEach(0 ..< DefaultMeasure.shared.measure.count, id: \.self) { index in
                            Text(DefaultMeasure.shared.measure[index].measureTitle)
                                .tag(DefaultMeasure.shared.measure[index])
                        }
                    }, frameWith: 140, frameHeight: 50, cornerRadius: 15)
                }
                HStack{
                    PlusButtonExt(title: "+") {
                        addProductScreen.toggle()}
                    .fullScreenCover(isPresented: $addProductScreen){
                        NavigationView { AddItemView(item: true) }
                            .environmentObject(viewModel)
                    }
                    PickerExt(selection: $viewModel.selectedProduct, content: {
                        ForEach(0 ..< DefaultProduct.shared.products.count, id: \.self) { index in
                            Text(DefaultProduct.shared.products[index].title)
                                .tag(DefaultProduct.shared.products[index])
                        }.foregroundColor(.white)
                    }, frameWith: 280, frameHeight: 100, cornerRadius: 20)
                    
                    PlusButtonExt(title: "+"){
                        addMeasureScreen.toggle()
                    }
                    .fullScreenCover(isPresented: $addMeasureScreen){
                        NavigationView { AddItemView(item: false) }
                            .environmentObject(viewModel)
                    }
                }
                ButtonExt(title: "Посчитать",
                                action: { viewModel.converterUnit()},
                                color: .yellow.opacity(0.5))
                ButtonExt(title: "Запомнить",
                                action: { viewModel.saveInTable()},
                                color: .orange.opacity(0.5))
                if viewModel.saved.isEmpty{
                    Spacer()
                    Text("Сохраните свои расчеты!")
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.saved, id: \.self) { sav in
                            Cell(saved: sav)
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
                DefaultProduct.shared.getProductsListDB()
                DefaultMeasure.shared.getMeasureListDB()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
    }
}


//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
