//
//  WalletView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        Text("Wallet")
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
            .environmentObject(ContentModel())
    }
}
