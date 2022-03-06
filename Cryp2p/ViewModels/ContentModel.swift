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
    
    @Published var bg = Color(red: 44 / 255, green: 45 / 255, blue: 47 / 255)
    @Published var bgDark = Color(red: 26 / 255, green: 26 / 255, blue: 27 / 255)
    @Published var buttonClrProminent = Color(red: 255 / 255, green: 0 / 255, blue: 140 / 255)
    @Published var buttonClrObscure = Color(red: 129 / 255, green: 133 / 255, blue: 138 / 255)
    @Published var objectsClrMedium = Color(red: 53 / 255, green: 54 / 255, blue: 56 / 255)
    @Published var fontClr = Color(red: 1, green: 1, blue: 1)
    @Published var fontClrDark = Color(red: 0, green: 0, blue: 0)
    
    
    // MARK: State variables
    
    @Published var viewShown: Int = 0
    @AppStorage("primaryAddress") var primary: Int = 0
    @Published var showingWalletManagerSheet: Bool = false
    @Published var showingAddWalletSheet: Bool = false
    @Published var showingQRScan: Bool = true
    
    @Published var phrase: String = ""
    @Published var addresses: [String] = ["0x709Cd5F1A1107eD1c4e00A42B349A22701Bebb86", "57xndEKxm8hjinu81YAzakxWiC2u7AxS7rZyC2y2KfDC"]
    @Published var nicknames: [String] = ["FífaRosťa", "RosťaFífa"]
    
    
    // MARK: Coin Cap service
    
    let coinCapService = CoinCapPriceService()
    
    func setupCoinCapService() {
        coinCapService.connect()
    }
}
