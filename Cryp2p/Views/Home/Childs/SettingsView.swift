//
//  SettingsView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button(action: {
                        
                    }, label: {
                        ButtonLabel(text: "Help")
                    })
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ContentModel())
    }
}
