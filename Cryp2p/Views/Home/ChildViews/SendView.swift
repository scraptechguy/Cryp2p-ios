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
        ScrollView(showsIndicators: false) {
            VStack {
                Heading(text: "Address")
                    .padding([.top], model.screenSize.width / 4.3)
                
                ZStack {
                    Rectangle()
                        .fill(model.objectsClrMedium)
                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 6)
                        .cornerRadius(model.screenSize.width / 15)
                    
                    Text(model.phrase)
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 20))
                        .frame(width: model.screenSize.width  / 1.3, height: model.screenSize.width / 10, alignment: .leading)
                }
                
                Heading(text: "Amount")
                    .padding([.top], model.screenSize.width / 15)
                
                ZStack {
                    Rectangle()
                        .fill(model.objectsClrMedium)
                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 6)
                        .cornerRadius(model.screenSize.width / 15)
                    
                    Text("0.1")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 15))
                        .frame(width: model.screenSize.width  / 1.6, height: model.screenSize.width / 10, alignment: .leading)
                    
                    Text("~ $9")
                        .foregroundColor(model.buttonClrObscure)
                        .font(.system(size: model.screenSize.width / 20))
                        .frame(width: model.screenSize.width  / 1.5, height: model.screenSize.width / 10, alignment: .trailing)
                }
                
                Button(action: {
                    
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrMedium)
                                .frame(width: model.screenSize.width / 1.7, height: model.screenSize.width / 7)
                                .cornerRadius(model.screenSize.width / 15)
                            
                            Text("Send")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 18))
                        }
                }).padding([.top], model.screenSize.width / 3)
            }
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
            .environmentObject(ContentModel())
    }
}
