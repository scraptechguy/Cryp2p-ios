//
//  ReceiveView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ReceiveView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Your QR code")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 10))
                
                Image(uiImage: generateQRCode(from: model.addresses[model.primary]))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 1.4)
                
                Text(model.addresses[model.primary])
                    .foregroundColor(model.buttonClrObscure)
                    .font(.system(size: model.screenSize.width / 20))
                    .frame(width: model.screenSize.width / 2, height: model.screenSize.width / 15)
                    .padding([.top])
                    .padding([.bottom], model.screenSize.width / 3.5)
            }
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
            .environmentObject(ContentModel())
    }
}
