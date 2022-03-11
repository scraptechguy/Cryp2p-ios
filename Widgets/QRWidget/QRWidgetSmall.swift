//
//  QRWidgetSmall.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 3/9/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct QRWidgetSmall: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var entry: SimpleEntry
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State var image = UIImage()
    
    var body: some View {
        ZStack {
            model.fontClr.ignoresSafeArea()
            
            Image(uiImage: image)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: model.screenSize.width / 3, height: model.screenSize.width / 3)
        }.onAppear {
            image = generateQRCode(from: model.addresses[model.primary])
        }
        .onChange(of: model.primary) { _ in
            image = generateQRCode(from: model.addresses[model.primary])
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
