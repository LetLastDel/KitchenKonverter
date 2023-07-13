//
//  ButtonExt.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import SwiftUI

struct PlusButtonExt: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(title) {
            action()
        }
        .bold()
        .tint(.black)
        .frame(width: 40, height: 100)
        .background(.black.opacity(0.3))
        .cornerRadius(15)
    }
}

 struct ButtonExt: View {
    var title: String
    var action: () -> Void
    var color: Color
    var hSize: CGFloat = 50
    var wSize: CGFloat = 330
    var body: some View {
        Button(title) {
            action()
        }
        .foregroundColor(.black)
        .frame(width: wSize, height: hSize)
        .background(color)
        .cornerRadius(15)
        .padding(.vertical, 5)
    }
}


//struct ButtonExt_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonExt()
//    }
//}

