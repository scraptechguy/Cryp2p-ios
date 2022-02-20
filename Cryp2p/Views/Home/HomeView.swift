//
//  HomeView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct HomeView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            TabView(selection: $model.viewShown) {
                WalletView().tag(0)
                
                ReceiveView().tag(1)
                
                ScanView().tag(2)
                
                SendView().tag(3)
                
                SettingsView().tag(4)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: model.screenSize.width, height: model.screenSize.height)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    
                    // MARK: Wallet button
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 0
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 0 {
                                            Image(systemName: "dollarsign.circle")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                                .foregroundColor(model.buttonClrProminent)
                                            
                                            Text("Wallet")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 35))
                                        } else {
                                            Image(systemName: "dollarsign.circle")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClrObscure)
                                            
                                            Text("Wallet")
                                                .foregroundColor(model.buttonClrObscure)
                                                .font(.system(size: model.screenSize.width / 35))
                                        }
                                    }
                                })
                        
                        Spacer()
                    }
                    
                    
                    // MARK: Receive button
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 1
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 1 {
                                            Image(systemName: "arrow.down.app")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                                .foregroundColor(model.buttonClrProminent)
                                            
                                            Text("Receive")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 35))
                                        } else {
                                            Image(systemName: "arrow.down.app")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                                .foregroundColor(model.buttonClrObscure)
                                            
                                            Text("Receive")
                                                .foregroundColor(model.buttonClrObscure)
                                                .font(.system(size: model.screenSize.width / 35))
                                        }
                                    }
                        })
                        
                        Spacer()
                    }
                    
                    
                    // MARK: Scan button
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 2
                                    }
                                }, label: {
                                    ZStack {
                                        if model.viewShown == 2 {
                                            Circle()
                                                .fill(model.objectsClrMedium)
                                                .frame(width: model.screenSize.width / 8, height: model.screenSize.width / 8)
                                                .foregroundColor(model.buttonClrProminent)
                                                .overlay(Circle().stroke(model.buttonClrProminent, lineWidth: model.screenSize.width / 150))
                                            
                                            Image(systemName: "qrcode.viewfinder")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClrProminent)
                                        } else {
                                            Circle()
                                                .fill(model.objectsClrMedium)
                                                .frame(width: model.screenSize.width / 8, height: model.screenSize.width / 8)
                                                .foregroundColor(model.buttonClrObscure)
                                                .overlay(Circle().stroke(model.buttonClrObscure, lineWidth: model.screenSize.width / 150))
                                            
                                            Image(systemName: "qrcode.viewfinder")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClrObscure)
                                        }
                                    }
                        }).padding([.bottom], model.screenSize.width / 15)
                        
                        Spacer()
                    }
                    
                    
                    // MARK: Send button
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 3
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 3 {
                                            Image(systemName: "paperplane")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 19)
                                                .foregroundColor(model.buttonClrProminent)
                                            
                                            Text("Send")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 35))
                                        } else {
                                            Image(systemName: "paperplane")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 19)
                                                .foregroundColor(model.buttonClrObscure)
                                            
                                            Text("Send")
                                                .foregroundColor(model.buttonClrObscure)
                                                .font(.system(size: model.screenSize.width / 35))
                                        }
                                    }
                        })
                        
                        Spacer()
                    }
                    
                    
                    // MARK: Settings button
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 4
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 4 {
                                            Image(systemName: "gearshape")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                                .foregroundColor(model.buttonClrProminent)
                                            
                                            Text("Settings")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 35))
                                        } else {
                                            Image(systemName: "gearshape")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                                .foregroundColor(model.buttonClrObscure)
                                            
                                            Text("Settings")
                                                .foregroundColor(model.buttonClrObscure)
                                                .font(.system(size: model.screenSize.width / 35))
                                        }
                                    }
                        })
                        
                        Spacer()
                    }
                }.padding([.bottom], model.screenSize.width / 40)
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 4.3)
                    .background(Rectangle()
                                    .fill(model.objectsClrMedium)
                    )
            }.ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
