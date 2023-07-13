//
//  ChangeMeasureView.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 21.04.2023.
//

import SwiftUI

struct ChangeMeasureView: View {
    @StateObject var viewModel: ChangeMeasureViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var settingViewModel: SettingViewModel

    var measure: MeasureModel

    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text("Внесите изменения!").bold()
                        .padding()
                    TextField("Введите название", text: $viewModel.measureTitle)
                        .padding()
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
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
                    viewModel.changeMeasure()
                    settingViewModel.updateMeasureTable()
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
            Button("Удалить"){
                viewModel.deleteMeasure()
                settingViewModel.updateMeasureTable()
                presentationMode.wrappedValue.dismiss()
            }
            .frame(width: 300, height: 30)
            .tint(.black)
            .background(.orange)
            .cornerRadius(20)
            .padding()
            
        }
        .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.green, .yellow, .orange, .pink, .red, .purple, .teal, .accentColor], startPoint: .bottomLeading, endPoint: .topTrailing))
    }}

struct ChangeMeasureView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeMeasureView(viewModel: ChangeMeasureViewModel(measure: MeasureModel()), measure: MeasureModel(measureTitle: "Кувшин", weight: 220, bulkType: "Масса"))
    }
}
