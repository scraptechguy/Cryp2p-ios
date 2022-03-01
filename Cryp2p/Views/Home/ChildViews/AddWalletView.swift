//
//  AddWalletView.swift
//  Cryp2p
//
//  Created by Rostislav Brož on 3/1/22.
//

import SwiftUI

struct AddWalletView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    @State var nickname: String = ""
    @State var address: String = ""
    @State var message: String = ""
    @State var statusFontColor: Color = .white
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    VStack {
                        
                        TextField("Nickname for you wallet", text: $nickname)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding()
                            .background(model.objectsClrMedium)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(model.screenSize.width / 15)
                            .padding([.top], model.screenSize.width / 4)
                            .padding([.bottom], 20)
                            .padding([.horizontal], model.screenSize.width / 10)
                        
                        TextField("Address of your walllet", text: $address)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding()
                            .background(model.objectsClrMedium)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(model.screenSize.width / 15)
                            .padding([.bottom], 20)
                            .padding([.horizontal], model.screenSize.width / 10)

                        HStack {
                            Circle()
                                .fill(statusFontColor)
                                .frame(width: model.screenSize.width / 40, height: model.screenSize.width / 40)
                            
                            Text("Status: ")
                                .foregroundColor(model.buttonClrObscure)
                                .font(.system(size: model.screenSize.width / 25))
                            
                            Text(message)
                                .foregroundColor(model.fontClr) // TODO - add confetti effect after successful login
                        }
                        
                        Button(action: {
                                    statusFontColor = Color(red: 1, green: 203 / 255, blue: 107 / 255)
                                    message = "Loading..."
                                    
                                    if (nickname == "" || address == "") {
                                        statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                                        message = "Missing fields"
                                        return
                                    } else {
                                        model.nicknames.append(nickname)
                                        model.addresses.append(address)
                                    }
                                }, label: {
                                    SmallButtonLabel(text: "Log in")
                                }).padding([.top], model.screenSize.width / 5)
                    }
                }
            }
        }
    }
}

struct AddWalletView_Previews: PreviewProvider {
    static var previews: some View {
        AddWalletView()
            .environmentObject(ContentModel())
    }
}
