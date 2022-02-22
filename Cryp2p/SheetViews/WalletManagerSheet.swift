//
//  WalletManagerSheet.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/20/22.
//

import SwiftUI

struct WalletManagerSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text(model.phrase)
    }
}

struct WalletManagerSheet_Previews: PreviewProvider {
    static var previews: some View {
        WalletManagerSheet()
    }
}
