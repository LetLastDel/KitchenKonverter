//
//  SettingViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 21.04.2023.
//

import Foundation

class SettingViewModel: ObservableObject {
    func updateMeasureTable() {
        DefaultMeasure.shared.getMeasureListDB()
    }
    func updateProductTable() {
        DefaultProduct.shared.getProductsListDB()
    }
}
