//
//  ReceiveView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct ReceiveView: View {
    var body: some View {
        Text("Receive")
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
            .environmentObject(ContentModel())
    }
}
