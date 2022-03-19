//
//  QRWidgetSmall.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 3/9/22.
//

import SwiftUI

struct QRWidgetSmall: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var entry: SimpleEntry
    
    @State var image = UIImage()
    
    var body: some View {
        ZStack {
            model.fontClr.ignoresSafeArea()
            
            Image(uiImage: entry.qrCode)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: model.screenSize.width / 3, height: model.screenSize.width / 3)
        }
    }
}
