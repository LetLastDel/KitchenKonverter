//
//  PickerExt.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 13.07.2023.
//

import SwiftUI

struct PickerExt<T: Hashable, Content: View>: View {
    @Binding var selection: T
    var content: () -> Content
    var frameWith: CGFloat
    var frameHeight: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        Picker("", selection: $selection, content: content)
            .pickerStyle(.wheel)
            .frame(width: frameWith, height: frameHeight)
            .background(.black.opacity(0.3))
            .cornerRadius(cornerRadius)
    }
}

//struct PickerExt_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerExt()
//    }
//}

