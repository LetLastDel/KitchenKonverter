//
//  TabBarViewModel.swift
//  KitchenConverter
//
//  Created by A.Stelmakh on 22.04.2023.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject{
    //юзер дефолт, проверка на первый запуск, если первый, то в табБарВью вызываются функции первичного заполнения Реалма начальными значениями
@AppStorage("firstLoad") var firstLoad = true
}
