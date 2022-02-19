//
//  ContentModel.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    // MARK: Screen bounds
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    // MARK: UI Colors
    
    //@Published var bg = Color(red: 210 / 255, green: 39 / 255, blue: 122 / 255)
    //@Published var bg = Color(red: 12 / 255, green: 29 / 255, blue: 127 / 255)
    @Published var bg = Color(red: 255 / 255, green: 227 / 255, blue: 227 / 255)
    @Published var buttonClr = Color(red: 255 / 255, green: 0 / 255, blue: 140 / 255)
    @Published var fontClr = Color(red: 1, green: 1, blue: 1)
    @Published var fontClrDark = Color(red: 0, green: 0, blue: 0)
    
    @Published var viewShown: Int = 0
    
    @Published var showingMenuSheet: Bool = false
}
