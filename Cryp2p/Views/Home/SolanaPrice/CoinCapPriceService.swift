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
        self.receiveMessage()
    }
    
    
    private func receiveMessage() {
        wsTask?.receive { [weak self] result in
            guard let self = self else {return}
                switch result {
                    case .success(let message):
                        switch message {
                            case .string(let text):
                                print("Received data: \(text)")
                                if let data = text.data(using: .utf8) {
                                    self.onReceiveData(data)
                                }
                            
                            case .data(let data):
                                self.onReceiveData(data)
                            
                            default:
                                break
                        }
                        
                        self.receiveMessage()
                        
                    case .failure(let error):
                        print("Failed to receive message\(error.localizedDescription)")
                }
        }
    }
    
    
    private func onReceiveData(_ data: Data) {
        guard let dictionary = try? JSONSerialization.jsonObject(with: data) as? [String:String] else {return}
        
        var newDictionary = [String:Coin]()
        dictionary.forEach {(key, value) in
            let value = Double(value) ?? 0
            newDictionary[key] = Coin(name: key.capitalized, value: value)
        }
        
        let mergedDictionary = coinDictionary.merging(newDictionary) {old, new in new}
        coinDictionarySubject.send(mergedDictionary)
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
