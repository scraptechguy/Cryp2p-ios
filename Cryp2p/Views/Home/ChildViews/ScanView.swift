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
            if model.showingQRScan {
                ZStack {
                    CodeScannerView(codeTypes: [.qr], scanMode: .continuous, scanInterval: 0.5, simulatedData: "Fifa", shouldVibrateOnSuccess: true, completion: handleScan)
                        .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 1.4)
                        .padding([.bottom], model.screenSize.width / 3.5)
                }
            }
            
            if !model.showingQRScan {
                ZStack {
                    Text("NFC")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 5))
                }
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
        
        withAnimation {
            model.viewShown = 3
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
            .environmentObject(ContentModel())
    }
}
