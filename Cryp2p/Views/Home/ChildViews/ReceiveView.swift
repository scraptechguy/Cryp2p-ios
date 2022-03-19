//
//  ReceiveView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct ReceiveView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            if model.showingQRScan {
                VStack {
                    Image(uiImage: model.generateQRCode(from: model.addresses[model.primary]))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 1.4)
                    
                    Button(action: {
                            UIPasteboard.general.string = model.addresses[model.primary]
                        }, label: {
                            HStack {
                                Text(model.addresses[model.primary])
                                    .foregroundColor(model.buttonClrObscure)
                                    .font(.system(size: model.screenSize.width / 20))
                                    .frame(width: model.screenSize.width / 2, height: model.screenSize.width / 15)
                                    .padding([.top])
                                    .padding([.bottom], model.screenSize.width / 3.5)
                                
                                Image(systemName: "rectangle.on.rectangle")
                                    .padding([.top])
                                    .padding([.bottom], model.screenSize.width / 3.5)
                            }
                    })
                }
            } else {
                Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "viewfinder.circle")
                            
                            Text("Start transmitting")
                        }
                })
            }
        }
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
            .environmentObject(ContentModel())
    }
}
