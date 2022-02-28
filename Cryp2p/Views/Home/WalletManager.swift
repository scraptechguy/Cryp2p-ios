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
                
                Rectangle()
                    .fill(model.bg)
                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 5)
                    .cornerRadius(model.screenSize.width / 15)
                    .padding([.bottom], model.screenSize.width / 8)
                
                // MARK: Scan view not shown
                
                if model.addresses != [] {
                    if model.viewShown != 2 {
                        VStack {
                            Group {
                                Text(model.nicknames[model.primary])
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 17))
                                    .frame(width: model.screenSize.width / 1.9, height: model.screenSize.width / 15, alignment: .leading)
                            }.frame(width: model.screenSize.width / 1.3, alignment: .leading)
                            
                            Group {
                                Text(model.addresses[model.primary])
                                    .foregroundColor(model.buttonClrObscure)
                                    .font(.system(size: model.screenSize.width / 25))
                                    .frame(width: model.screenSize.width / 1.7, height: model.screenSize.width / 25, alignment: .leading)
                            }.frame(width: model.screenSize.width / 1.3, alignment: .leading)
                        }.padding([.bottom], model.screenSize.width / 8)
                    } else {
                        
                        // MARK: Scan view shown
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                        model.showingQRScan = true
                                    }, label: {
                                        if model.showingQRScan {
                                            VStack {
                                                Image(systemName: "viewfinder.circle")
                                                    .resizable()
                                                    .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                                    .foregroundColor(model.buttonClrProminent)
                                                
                                                Text("QR scan")
                                                    .foregroundColor(model.fontClr)
                                                    .font(.system(size: model.screenSize.width / 25))
                                            }
                                        } else {
                                            VStack {
                                                Image(systemName: "viewfinder.circle")
                                                    .resizable()
                                                    .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                                    .foregroundColor(model.buttonClrObscure)
                                                
                                                Text("QR scan")
                                                    .foregroundColor(model.buttonClrObscure)
                                                    .font(.system(size: model.screenSize.width / 25))
                                            }
                                        }
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                        model.showingQRScan = false
                                    }, label: {
                                        if !model.showingQRScan {
                                            VStack {
                                                Image(systemName: "antenna.radiowaves.left.and.right.circle")
                                                    .resizable()
                                                    .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                                    .foregroundColor(model.buttonClrProminent)
                                                
                                                Text("NFC")
                                                    .foregroundColor(model.fontClr)
                                                    .font(.system(size: model.screenSize.width / 25))
                                            }
                                        } else {
                                            VStack {
                                                Image(systemName: "antenna.radiowaves.left.and.right.circle")
                                                    .resizable()
                                                    .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                                    .foregroundColor(model.buttonClrObscure)
                                                
                                                Text("NFC")
                                                    .foregroundColor(model.buttonClrObscure)
                                                    .font(.system(size: model.screenSize.width / 25))
                                            }
                                        }
                            })
                            
                            Spacer()
                        }.padding([.bottom], model.screenSize.width / 8)
                    }
                } else {
                    Text("Get started by adding a new wallet")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 20))
                }
                
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
