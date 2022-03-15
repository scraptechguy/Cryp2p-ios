//
//  LaunchView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct LaunchView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        if model.onboardingShown {
            HomeView()
                .onAppear {
                    PriceTrackerViewModel().setupCoinCapService()
                }
        } else {
            OnboardingView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
