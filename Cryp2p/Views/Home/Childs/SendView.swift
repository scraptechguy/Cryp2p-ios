//
//  SendView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct SendView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text("Send")
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
            .environmentObject(ContentModel())
    }
}
