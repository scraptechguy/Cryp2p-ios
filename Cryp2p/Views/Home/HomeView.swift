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
                    Button(action: {model.viewShown = 0},
                           label: {
                                Text("0")
                    })
                    
                    Button(action: {model.viewShown = 1},
                           label: {
                                Text("1")
                    })
                    
                    Button(action: {model.viewShown = 2},
                           label: {
                                Text("2")
                    })
                }.padding([.bottom], model.screenSize.width / 10)
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
