//
//  ScanView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI
import CodeScanner
import CoreNFC

struct ScanView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    @State private var statusMessage: String = "Scanning active!"
    @State private var statusFontColor: Color = .white
    
    @State var data = ""
    
    var body: some View {
        ZStack {
            if model.showingQRScan {
                ZStack {
                    CodeScannerView(codeTypes: [.qr], scanMode: .continuous, scanInterval: 0.25, simulatedData: "Fifa", shouldVibrateOnSuccess: true, completion: handleScan)
                        .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 1.4)
                        .cornerRadius(model.screenSize.width / 15)
                        .padding([.bottom], model.screenSize.width / 2.5)
                }
            } else {
                ZStack {
                    VStack {
                        Text(data)
                        
                        nfcButton(data: self.$data)
                    }
                }
            }
            
            HStack {
                Circle()
                    .fill(statusFontColor)
                    .frame(width: model.screenSize.width / 40, height: model.screenSize.width / 40)
                
                Text("Status: ")
                    .foregroundColor(model.buttonClrObscure)
                    .font(.system(size: model.screenSize.width / 25))
                
                Spacer()
                
                Text(statusMessage)
                    .foregroundColor(model.fontClr)
                    .multilineTextAlignment(.center)
            }.frame(width: model.screenSize.width / 1.7)
                .padding([.top], model.screenSize.width / 1.5)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
            case .success(let result):
                if result.string.count == 44 {
                    withAnimation {
                        statusMessage = "Scanning successful!"
                        statusFontColor = Color(red: 98 / 255, green: 252 / 255, blue: 98 / 255)
                        model.phrase = result.string
                    
                        model.viewShown = 3
                        
                        statusMessage = "Scanning active!"
                        statusFontColor = .white
                    }
                } else {
                    withAnimation {
                        statusMessage = "Oops, this is not a valid address!"
                        statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                    }
                }
                
            case .failure(let error):
                statusMessage = "Scanning failed: \(error.localizedDescription)"
                statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
        }
    }
}


struct nfcButton: UIViewRepresentable {
    @Binding var data: String
    
    func makeUIView(context: UIViewRepresentableContext<nfcButton>) -> UIButton {
        let button = UIButton()
        button.setTitle("Start scanning", for: .normal)
        button.addTarget(context.coordinator, action: #selector(context.coordinator.beginScan(_:)), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: UIViewRepresentableContext<nfcButton>) {
        // nope
    }
    
    func makeCoordinator() -> nfcButton.Coordinator {
        return Coordinator(data: $data)
    }
    
    class Coordinator: NSObject, NFCNDEFReaderSessionDelegate {
        var session: NFCNDEFReaderSession?
        @Binding var data: String
        
        init(data: Binding<String>) {
            _data = data
        }
        
        @objc func beginScan(_ sender: Any) {
            guard NFCNDEFReaderSession.readingAvailable else {
                print("Error: Scanning not supported!")
                return
            }
            
            session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: true)
            session?.alertMessage = "Hold your iPhone near to scan!"
            session?.begin()
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
            
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
            guard
                let nfcMess = messages.first,
                let record = nfcMess.records.first,
                record.typeNameFormat == .absoluteURI || record.typeNameFormat == .nfcWellKnown,
                let payload = String(data: record.payload, encoding: .utf8)
                    
            else {
                return
            }
            
            print(payload)
            self.data = payload
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
            if let readerError = error as? NFCReaderError {
                if readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead && readerError.code != .readerSessionInvalidationErrorUserCanceled {
                    print("Error: \(readerError.localizedDescription)")
                }
            }
            
            self.session = nil
        }
    }
}


struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
            .environmentObject(ContentModel())
    }
}
