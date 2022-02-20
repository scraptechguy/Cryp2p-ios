//
//  LabelStyles.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 2/19/22.
//

import Foundation
import SwiftUI

// MARK: Heading

struct Heading: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(model.buttonClrObscure)
            .font(.system(size: model.screenSize.width / 15))
            .frame(width: model.screenSize.width / 1.2, alignment: .leading)
    }
}


// MARK: Button label

struct ButtonLabel: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(model.objectsClrMedium)
                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                .cornerRadius(model.screenSize.width / 28)
        
            Text(text)
                .foregroundColor(model.fontClr)
                .font(.system(size: model.screenSize.width / 17))
                .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 8, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(model.buttonClrProminent)
                .frame(width: model.screenSize.width / 30, height: model.screenSize.width / 20)
                .padding(.leading, model.screenSize.width / 1.5)
        }
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(text: "Privacy Policy")
            .environmentObject(ContentModel())
    }
}
