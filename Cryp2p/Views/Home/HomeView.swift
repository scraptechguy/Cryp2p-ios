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
                                        .foregroundColor(model.bg)
                                } else {
                                    Image(systemName: "arrow.down.app")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                        .foregroundColor(model.bg)
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
                                            .foregroundColor(Color.purple)
                                    } else {
                                        Circle()
                                            .fill()
                                            .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
                                            .foregroundColor(Color.blue)
                                    }
                                    
                                    Image(systemName: "qrcode.viewfinder")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 12, height: model.screenSize.width / 12)
                                        .foregroundColor(model.bg)
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
                                        .foregroundColor(model.bg)
                                } else {
                                    Image(systemName: "location")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                        .foregroundColor(model.bg)

                                }
                    })
                    
                    Spacer()
                }.padding([.bottom], model.screenSize.width / 25)
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 5)
                    .background(Rectangle()
                                    .fill(Color.gray)
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
