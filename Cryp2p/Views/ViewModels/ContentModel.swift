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
    
    @Published var bg: Color = Color(red: 1, green: 1, blue: 1)
}
