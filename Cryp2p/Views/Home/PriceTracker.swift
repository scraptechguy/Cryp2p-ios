//
//  PriceTracker.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/21/22.
//

import SwiftUI

struct PriceTracker: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var price: Float = round(Float.random(in: 90...92) * 100) / 100.0
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(model.bgDark)
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 3.3)
                    .cornerRadius(model.screenSize.width / 15)
                    
                HStack {
                    Text("$\(price)")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 12))
                    
                    Text("/ SOL")
                        .foregroundColor(model.buttonClrObscure)
                        .font(.system(size: model.screenSize.width / 18))
                }.padding([.top], model.screenSize.width / 13)
                    .frame(width: model.screenSize.width / 1.3, alignment: .leading)
            }
            
            Spacer()
        }.ignoresSafeArea()
    }
}

struct PriceTracker_Previews: PreviewProvider {
    static var previews: some View {
        PriceTracker()
            .environmentObject(ContentModel())
    }
}
