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
                    
                    Button(action: {model.viewShown = 0},
                           label: {
                                Text("0")
                    })
                    
                    Spacer()
                    
                    Button(action: {model.viewShown = 1},
                           label: {
                                ZStack {
                                    Circle()
                                        .fill()
                                        .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
                                        .foregroundColor(Color.purple)
                                    
                                    Image(systemName: "qrcode.viewfinder")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 15, height: model.screenSize.width / 15)
                                        .foregroundColor(Color.white)
                                }
                    })
                    
                    Spacer()
                    
                    Button(action: {model.viewShown = 2},
                           label: {
                                Text("2")
                    })
                    
                    Spacer()
                }.padding([.bottom], model.screenSize.width / 10)
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
