//
//  HomeView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import CodeScanner
import Combine
import Network

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
            
            WalletManager()
            
            
            // MARK: Navigation bar
            
            NavigationBar()
            
            
            // MARK: Price tracker
            
            PriceTracker(priceTrackerModel: .init(name: PriceTrackerViewModel().name, value: PriceTrackerViewModel().value))
        }.preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
