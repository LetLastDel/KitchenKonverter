//
//  TextFieldExt.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import SwiftUI

struct TextFieldExt: View {
    var title: String = ""
    @Binding var text: String
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .background(.white.opacity(0.5))
            .cornerRadius(20)
    }
}

//struct TextFieldExt_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldExt()
//    }
//}
