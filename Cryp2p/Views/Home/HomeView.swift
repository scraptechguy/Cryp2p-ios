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
                                            Image(systemName: "dollarsign.circle.fill")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClr)
                                        } else {
                                            Image(systemName: "dollarsign.circle")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClr)
                                        }
                                        
                                        Text("Wallet")
                                            .foregroundColor(model.buttonClr)
                                            .font(.system(size: model.screenSize.width / 35))
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
                                            Image(systemName: "arrow.down.app.fill")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClr)
                                        } else {
                                            Image(systemName: "arrow.down.app")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClr)
                                        }
                                        
                                        Text("Receive")
                                            .foregroundColor(model.buttonClr)
                                            .font(.system(size: model.screenSize.width / 35))
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
                                                .fill()
                                                .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
                                                .foregroundColor(model.buttonClr)
                                        } else {
                                            Circle()
                                                .fill()
                                                .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
                                                .foregroundColor(Color.pink)
                                        }
                                        
                                        Image(systemName: "qrcode.viewfinder")
                                            .resizable()
                                            .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                            .foregroundColor(model.fontClr)
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
                                            Image(systemName: "paperplane.fill")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15.9)
                                                .foregroundColor(model.buttonClr)
                                        } else {
                                            Image(systemName: "paperplane")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15.9)
                                                .foregroundColor(model.buttonClr)

                                        }
                                        
                                        Text("Send")
                                            .foregroundColor(model.buttonClr)
                                            .font(.system(size: model.screenSize.width / 35))
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
                                            Image(systemName: "gearshape.fill")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClr)
                                        } else {
                                            Image(systemName: "gearshape")
                                                .resizable()
                                                .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                                .foregroundColor(model.buttonClr)
                                        }
                                        
                                        Text("Settings")
                                            .foregroundColor(model.buttonClr)
                                            .font(.system(size: model.screenSize.width / 35))
                                    }
                        })
                        
                        Spacer()
                    }
                }.padding([.bottom], model.screenSize.width / 50)
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 4.5)
                    .background(Rectangle()
                                    .fill(model.fontClr)
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
