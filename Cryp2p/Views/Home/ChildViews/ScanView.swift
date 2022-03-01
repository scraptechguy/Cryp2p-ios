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
    
    @State private var message: String = "Scanning active!"
    @State private var statusFontColor: Color = .white
    
    var body: some View {
        ZStack {
            if model.showingQRScan {
                ZStack {
                    CodeScannerView(codeTypes: [.qr], scanMode: .continuous, scanInterval: 0.25, simulatedData: "Fifa", shouldVibrateOnSuccess: true, completion: handleScan)
                        .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 1.4)
                        .cornerRadius(model.screenSize.width / 15)
                        .padding([.bottom], model.screenSize.width / 2.5)
                    
                    HStack {
                        Circle()
                            .fill(statusFontColor)
                            .frame(width: model.screenSize.width / 40, height: model.screenSize.width / 40)
                        
                        Text("Status: ")
                            .foregroundColor(model.buttonClrObscure)
                            .font(.system(size: model.screenSize.width / 25))
                        
                        Spacer()
                        
                        Text(message)
                            .foregroundColor(model.fontClr)
                            .multilineTextAlignment(.center)
                    }.frame(width: model.screenSize.width / 1.7)
                        .padding([.top], model.screenSize.width / 1.5)
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
                if result.string.count == 44 {
                    withAnimation {
                        message = "Scanning successful!"
                        statusFontColor = Color(red: 98 / 255, green: 252 / 255, blue: 98 / 255)
                        model.phrase = result.string
                    
                        model.viewShown = 3
                        
                        message = "Scanning active!"
                        statusFontColor = .white
                    }
                } else {
                    withAnimation {
                        message = "Oops, this is not a valid address!"
                        statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                    }
                }
                
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
