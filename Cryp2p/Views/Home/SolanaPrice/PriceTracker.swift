//
//  PriceTracker.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/21/22.
//

import SwiftUI
import Combine

struct PriceTracker: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    @ObservedObject var priceTrackerModel: PriceTrackerViewModel
    
    var body: some View {
        VStack {
            Button(action: {

                }, label: {
                    ZStack {
                        Rectangle()
                            .fill(model.bgDark)
                            .frame(width: model.screenSize.width, height: model.screenSize.width / 3.3)
                            .cornerRadius(model.screenSize.width / 15)
                            
                        HStack {
                            Text(priceTrackerModel.value)
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 12))
                            
                            Text("/ SOL")
                                .foregroundColor(model.buttonClrObscure)
                                .font(.system(size: model.screenSize.width / 18))
                        }.padding([.top], model.screenSize.width / 13)
                            .frame(width: model.screenSize.width / 1.3, alignment: .leading)
                    }
            })
            
            Spacer()
        }.onAppear {
            priceTrackerModel.subscribeToService()
        }
        .onChange(of: priceTrackerModel.value) { _ in
            print("value changed")
            priceTrackerModel.updateView()
        }
        .ignoresSafeArea()
    }
}

struct PriceTracker_Previews: PreviewProvider {
    static var previews: some View {
        PriceTracker(priceTrackerModel: .init(name: PriceTrackerViewModel().name, value: PriceTrackerViewModel().value))
            .environmentObject(ContentModel())
    }
}
