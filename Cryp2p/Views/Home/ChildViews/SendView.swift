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
    
    @State private var solanaInUSD: String = String(Float(ContentModel().amount) ?? 0.0 * 85)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Heading(text: "Address")
                    .padding([.top], model.screenSize.width / 4.3)
                
                TextField("Enter Solana address", text: $model.phrase)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .background(model.objectsClrMedium)
                    .foregroundColor(model.fontClr)
                    .cornerRadius(model.screenSize.width / 15)
                    .padding(.horizontal, model.screenSize.width / 10)
                
                Heading(text: "Amount")
                    .padding([.top], model.screenSize.width / 15)
                
                ZStack {
                    TextField("Enter the amount", text: $model.amount)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .padding()
                        .background(model.objectsClrMedium)
                        .foregroundColor(model.fontClr)
                        .cornerRadius(model.screenSize.width / 15)
                        .padding(.horizontal, model.screenSize.width / 10)
                    
                    Text("~ $\(solanaInUSD)")
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
                }).padding([.top], model.screenSize.width / 3.5)
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
