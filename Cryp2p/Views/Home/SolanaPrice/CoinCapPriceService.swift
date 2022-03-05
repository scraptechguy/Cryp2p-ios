//
//  CoinCapPriceService.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 3/5/22.
//

import Foundation
import Combine
import Network

class CoinCapPriceService: NSObject {
    private let session = URLSession(configuration: .default)
    private var wsTask: URLSessionWebSocketTask?
    
}
