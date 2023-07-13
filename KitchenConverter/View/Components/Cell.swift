//
//  Cell.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import SwiftUI

struct Cell: View {
    @State var saved: PositionModel
    var body: some View {
            HStack {
                Text(String(format: "%.2f",saved.inQua))
                Text(saved.inMeasure)
                Text(saved.product)
                Spacer()
                Text(String(format: "%.3f", saved.quantity, saved.measure))
            }
        }
    }

//struct Cell_Previews: PreviewProvider {
//    static var previews: some View {
//        Cell()
//    }
//}
