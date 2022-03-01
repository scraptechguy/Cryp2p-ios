//
//  WalletManagerSheet.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/20/22.
//

import SwiftUI

struct WalletManagerSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Heading(text: "Connected wallets")
                        .padding([.top], model.screenSize.width / 8)
                    
                    ForEach(model.addresses.indices, id: \.self) { i in
                        Button(action: {
                                withAnimation {
                                    model.primary = i
                                }
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .fill(model.objectsClrMedium)
                                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 5)
                                        .cornerRadius(model.screenSize.width / 15)
                                        
                                    VStack {
                                        Group {
                                            Text(model.nicknames[i])
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 17))
                                                .frame(width: model.screenSize.width / 1.9, height: model.screenSize.width / 15, alignment: .leading)
                                        }.frame(width: model.screenSize.width / 1.3, alignment: .leading)
                                        
                                        Group {
                                            Text(model.addresses[i])
                                                .foregroundColor(model.buttonClrObscure)
                                                .font(.system(size: model.screenSize.width / 25))
                                                .frame(width: model.screenSize.width / 1.7, height: model.screenSize.width / 25, alignment: .leading)
                                        }.frame(width: model.screenSize.width / 1.3, alignment: .leading)
                                    }
                                    
                                    if i == model.primary {
                                        Group {
                                            Image(systemName: "checkmark")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 22, height: model.screenSize.width / 22)
                                        }.frame(width: model.screenSize.width / 1.4, alignment: .trailing)
                                    }
                                }
                        })
                    }
                    
                    Button(action: {
                            model.showingAddWalletSheet = true
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrMedium)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 15)
                                
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(model.buttonClrProminent)
                                    
                                    Text("Add wallet")
                                        .foregroundColor(model.buttonClrProminent)
                                        .font(.system(size: model.screenSize.width / 18))
                                }
                            }
                        }).sheet(isPresented: $model.showingAddWalletSheet) {AddWalletSheet()}
                        .padding([.top], model.screenSize.width)
                }.frame(width: model.screenSize.width / 1.1)
                    .padding([.top, .bottom], model.screenSize.width / 10)
            }
            
            VStack {
                ZStack {
                    Title(text: "Wallet manager")
                    
                    VStack() {
                        Button(action: { model.showingWalletManagerSheet.toggle()},
                               label: {
                                    Text("Cancel")
                                        .padding([.bottom], model.screenSize.width / 25)
                        })
                    }.frame(width: model.screenSize.width / 1.15, alignment: .trailing)
                }
                
                Spacer()
            }.ignoresSafeArea()
        }
    }
}

struct WalletManagerSheet_Previews: PreviewProvider {
    static var previews: some View {
        WalletManagerSheet()
            .environmentObject(ContentModel())
    }
}
