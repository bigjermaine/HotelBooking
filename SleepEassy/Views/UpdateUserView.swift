//
//  UpdateUserView.swift
//  SleepEassy
//
//  Created by Apple on 07/02/2023.
//

import SwiftUI


struct UpdateUserView: View {
    
    @AppStorage("UserName") var userName = "Username"
    @AppStorage("Twitter") var twitterHandle = "@TwitterHandle"
    @AppStorage("EMail") var eMailAdress = "user@domain.com"
    @AppStorage("Location") var location = "Location"
    
    @State private var newUserName = ""
    @State private var newTwitterHandle = ""
    @State private var newEMail = ""
    @State private var newlocation = ""
    
    var body: some View {
        VStack {
            Text("Update user information:").font(.title2)
            HStack {
                TextField("Username", text: $newUserName).textFieldStyle(.roundedBorder)
                Button("Save") {
                    if newUserName.isEmpty == false {
                        userName = newUserName
                        newUserName = ""
                    }
                }.buttonStyle(.bordered)
            }
            HStack {
                TextField("Twitter", text: $newTwitterHandle).textFieldStyle(.roundedBorder)
                Button("Save") {
                    if newTwitterHandle.isEmpty == false {
                        twitterHandle = newTwitterHandle
                        newTwitterHandle = ""
                    }
                }.buttonStyle(.bordered)
            }
            HStack {
                TextField("E-Mail", text: $newEMail).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never)
                Button("Save") {
                    if newEMail.isEmpty == false {
                        eMailAdress = newEMail
                        newEMail = ""
                    }
                }.buttonStyle(.bordered)
            }
            HStack {
                TextField("Loaction", text: $newlocation ).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never)
                Button("Save") {
                    if location.isEmpty == false {
                        location  =  newlocation
                        newlocation = ""
                    }
                }.buttonStyle(.bordered)
            }
               
            }
        }
    }


struct UpdateUserView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUserView()
    }
}
