//
//  Extension.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import Foundation
import SwiftUI


///Note; Extension for textfield modifier
struct TextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(LinearGradient(colors: [.blue,.red,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
    }
}
///userdefaults to string 
extension UserDefaults {

    func setValue(value: String, key: String) {
        set(value, forKey: key)
        synchronize()
    }

    func getValue(key: String) -> String {
        return string(forKey: key) ?? "nigeria"
    }
}



///disable Keyboard for xbutton
extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
