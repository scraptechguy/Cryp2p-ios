//
//  WalletView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct WalletView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Heading(text: "Assets")
                .padding([.top], model.screenSize.width / 4.3)
            
            Rectangle()
                .fill(model.objectsClrMedium)
                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 4)
                .cornerRadius(model.screenSize.width / 15)
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
            .environmentObject(ContentModel())
    }
}
