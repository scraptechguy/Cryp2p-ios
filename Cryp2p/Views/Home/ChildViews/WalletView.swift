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
            
            ZStack {
                Rectangle()
                    .fill(model.objectsClrMedium)
                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 5)
                    .cornerRadius(model.screenSize.width / 15)
                
                HStack {
                    Image("SolanaIcon")
                        .resizable()
                        .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 10)
                        .padding([.trailing], model.screenSize.width / 50)
                    
                    Text("SOL")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 20))
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("6.9")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 15))
                            .frame(width: model.screenSize.width / 3, height: model.screenSize.width / 20, alignment: .trailing)
                        
                        Text("~ $616.9138")
                            .foregroundColor(model.buttonClrObscure)
                            .font(.system(size: model.screenSize.width / 25))
                            .frame(width: model.screenSize.width / 2.5, height: model.screenSize.width / 25, alignment: .trailing)
                    }
                }.frame(width: model.screenSize.width / 1.3)
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
            .environmentObject(ContentModel())
    }
}
