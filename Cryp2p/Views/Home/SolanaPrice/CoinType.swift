//
//  CoinType.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 3/5/22.
//

import Foundation

enum CoinType: String, Identifiable, CaseIterable {
    case solana
    // ?case ethereum
    
    var id: Self {self}
    var url: URL {URL(string: "https://coincap.io/assets/\(rawValue)")!}
    var description: String {rawValue.capitalized}
}
