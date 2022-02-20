//
//  SettingsView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct SettingsView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button(action: {
                        
                    }, label: {
                        ButtonLabel(text: "Help")
                    })
                    
                    Link(destination: URL(string: "https://youtu.be/dQw4w9WgXcQ")!,
                         label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrMedium)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 28)
                            
                                Text("Privacy policy")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 17))
                                    .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 8, alignment: .leading)
                                
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .foregroundColor(model.buttonClrProminent)
                                    .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 16)
                                    .padding(.leading, model.screenSize.width / 1.5)
                            }
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
