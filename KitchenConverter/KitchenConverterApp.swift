//
//  KitchenConverterApp.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 11.04.2023.
//

import SwiftUI

@main
struct KitchenConverterApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabBarView(viewModel: TabBarViewModel())
            }
        }
    }
}
