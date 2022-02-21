//
//  WalletManager.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/21/22.
//

import SwiftUI

struct WalletManager: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(model.objectsClrMedium)
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 1.65)
                    .cornerRadius(model.screenSize.width / 15)
                
                ZStack {
                    Rectangle()
                        .fill(model.bg)
                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 5)
                        .cornerRadius(model.screenSize.width / 15)
                    
                    VStack {
                        Group {
                            Text("FífaRosťa")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 17))
                                .frame(width: model.screenSize.width / 1.9, height: model.screenSize.width / 15, alignment: .leading)
                        }.frame(width: model.screenSize.width / 1.3, alignment: .leading)
                        
                        Group {
                            Text("0x709Cd5F1A1107eD1c4e00A42B349A22701Bebb86")
                                .foregroundColor(model.buttonClrObscure)
                                .font(.system(size: model.screenSize.width / 25))
                                .frame(width: model.screenSize.width / 1.7, height: model.screenSize.width / 25, alignment: .leading)
                        }.frame(width: model.screenSize.width / 1.3, alignment: .leading)
                    }
                }.padding([.bottom], model.screenSize.width / 8)
                
                Group {
                    Button(action: {
                                model.showingWalletManagerSheet = true
                            }, label: {
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                    .foregroundColor(model.buttonClrProminent)
                    }).sheet(isPresented: $model.showingWalletManagerSheet) {WalletManagerSheet()}
                }.padding([.bottom], model.screenSize.width / 2.2)
                    .frame(width: model.screenSize.width / 1.1, alignment: .trailing)
                
                Heading(text: "Wallet")
                    .padding([.bottom], model.screenSize.width / 2.2)
            }
        }
    }
}

struct WalletManager_Previews: PreviewProvider {
    static var previews: some View {
        WalletManager()
            .environmentObject(ContentModel())
    }
}
