//
//  ScanView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI
import CodeScanner

struct ScanView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            VStack {
                CodeScannerView(codeTypes: [.qr], scanMode: .continuous, scanInterval: 0.25, simulatedData: "Fifa", completion: handleScan)
                    .sheet(isPresented: $model.showingWalletManagerSheet) {WalletManagerSheet()}
                
                
            }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
            case .success(let result):
                model.phrase = result.string
                
            case .failure(let error):
                print("Scanning failed: \(error.localizedDescription)")
        }
        
        model.showingWalletManagerSheet = true
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
            .environmentObject(ContentModel())
    }
}
