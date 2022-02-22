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
                CodeScannerView(codeTypes: [.qr], simulatedData: "Fifa", completion: handleScan)
            }
            
            Text(model.phrase)
                .foregroundColor(.white)
            
            Button(action: {
                        model.isShowingScanner = true
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrMedium)
                                .frame(width: model.screenSize.width / 2, height: model.screenSize.width / 8)
                                .cornerRadius(model.screenSize.width / 28)
                        
                            Text("Start scanning")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 17))
                                .frame(width: model.screenSize.width / 1.6, height: model.screenSize.width / 8, alignment: .center)
                        }
            }).padding([.top], model.screenSize.width / 1.2)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        model.isShowingScanner = false
        
        switch result {
            case .success(let result):
                model.phrase = result.string
                
            case .failure(let error):
                print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
            .environmentObject(ContentModel())
    }
}
