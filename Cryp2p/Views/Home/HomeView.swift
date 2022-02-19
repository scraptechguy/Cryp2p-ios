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
                ReceiveView().tag(0)
                
                ScanView().tag(1)
                
                SendView().tag(2)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: model.screenSize.width, height: model.screenSize.height)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                            withAnimation {
                                model.viewShown = 0
                            }
                            },
                           label: {
                                if model.viewShown == 0 {
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
                    })
                    
                    Spacer()
                    
                    Button(action: {
                                withAnimation {
                                    model.viewShown = 1
                                }
                            },
                           label: {
                                ZStack {
                                    if model.viewShown == 1 {
                                        Circle()
                                            .fill()
                                            .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
                                            .foregroundColor(model.buttonClr)
                                    } else {
                                        Circle()
                                            .fill()
                                            .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
                                            .foregroundColor(Color.purple)
                                    }
                                    
                                    Image(systemName: "qrcode.viewfinder")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                        .foregroundColor(model.fontClr)
                                }
                    }).padding([.bottom], model.screenSize.width / 15)
                    
                    Spacer()
                    
                    Button(action: {
                                withAnimation {
                                    model.viewShown = 2
                                }
                            },
                           label: {
                                if model.viewShown == 2 {
                                    Image(systemName: "location.fill")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                        .foregroundColor(model.buttonClr)
                                } else {
                                    Image(systemName: "location")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                        .foregroundColor(model.buttonClr)

                                }
                    })
                    
                    Spacer()
                }.padding([.bottom], model.screenSize.width / 25)
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 5)
                    .background(Rectangle()
                                    .fill(model.fontClr)
                    )
            }.ignoresSafeArea()
            
            VStack {
                Button(action: {model.showingMenuSheet = true},
                       label: {
                    ZStack {
                        Circle()
                            .fill(model.buttonClr)
                            .frame(width: model.screenSize.width / 7, height: model.screenSize.width / 7)
                        
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                            .foregroundColor(model.fontClr)
                    }
                }).frame(width: model.screenSize.width / 1.1, alignment: .trailing)
                
                Spacer()
            }.sheet(isPresented: $model.showingMenuSheet) {MenuSheet()}
                .frame(height: model.screenSize.width / 0.5)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
