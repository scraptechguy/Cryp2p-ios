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
            
            
            // MARK: TabView
            
            TabView(selection: $model.viewShown) {
                WalletView().tag(0)
                
                ReceiveView().tag(1)
                
                ScanView().tag(2)
                
                SendView().tag(3)
                
                SettingsView().tag(4)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: model.screenSize.width, height: model.screenSize.height)
                .ignoresSafeArea()
            
            // MARK: Wallet address
            
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
            
            
            // MARK: Navigation bar
            
            NavigationBar()
            
            
            // MARK: Top
            
            VStack {
                ZStack {
                    Rectangle()
                        .fill(model.bgDark)
                        .frame(width: model.screenSize.width, height: model.screenSize.width / 3.3)
                        .cornerRadius(model.screenSize.width / 15)
                        
                    HStack {
                        Text("$91.35")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 12))
                        
                        Text("/ SOL")
                            .foregroundColor(model.buttonClrObscure)
                            .font(.system(size: model.screenSize.width / 18))
                    }.padding([.top], model.screenSize.width / 13)
                        .frame(width: model.screenSize.width / 1.3, alignment: .leading)
                }
                
                Spacer()
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
