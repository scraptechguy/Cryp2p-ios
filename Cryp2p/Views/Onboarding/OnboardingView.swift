//
//  OnboardingView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import SwiftUI

struct OnboardingView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Button(action: {
                model.onboardingShown = true
            }, label: {
                Text("Done")
                    .font(.system(size: model.screenSize.width / 8))
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(ContentModel())
    }
}
