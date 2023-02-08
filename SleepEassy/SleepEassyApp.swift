//
//  SleepEassyApp.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

@main
struct SleepEassyApp: App {
    @StateObject var hotelviewmodel = Hotelviewmodel()
    @StateObject  var userdeafultsHotel =  UserdeafultsHotel()
    @StateObject  var hotelcore  = hotelcoredataviewmodel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(hotelviewmodel)
                           .environmentObject(userdeafultsHotel)
                           .environmentObject(hotelcore)
        }
    }
}
