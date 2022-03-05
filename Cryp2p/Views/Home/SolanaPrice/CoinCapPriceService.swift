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
    
    private let coinDictionarySubject = CurrentValueSubject<[String: Coin], Never> ([:])
    private var coinDictionary: [String: Coin] {coinDictionarySubject.value}
    
    private let connectionStateSubject = CurrentValueSubject<Bool, Never> (false)
    private var isConnected: Bool {connectionStateSubject.value}
    
    
    func connect() {
        let coins = CoinType.allCases
            .map {$0.rawValue}
            .joined(separator: ",")
        
        let url = URL(string: "wss://ws.coincap.io/prices?assets=\(coins)")!
        wsTask = session.webSocketTask(with: url)
        wsTask?.delegate = self
        wsTask?.resume()
    }
    
    
    deinit {
        coinDictionarySubject.send(completion: .finished)
        connectionStateSubject.send(completion: .finished)
    }
}

extension CoinCapPriceService: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        
    }
}
