//
//  ContentView.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var hotelviewmodel = Hotelviewmodel()
    @StateObject  var userdeafultsHotel =  UserdeafultsHotel()
    @StateObject var hotelcore = hotelcoredataviewmodel()
    var body: some View {
        ///Note:creating the tabbar for the respective views
        TabView {
            HomeView()
                .environmentObject(hotelviewmodel)
            .tabItem {
            VStack{
            Text("Home")
           Image(systemName:"house.fill")
                    }
            }
            .tag(0)
            
          SearchView()
                .environmentObject(hotelviewmodel)
            .tabItem {
            VStack{
            Text("BasedLocationSearch")
          Image(systemName: "magnifyingglass.circle.fill")
                    }
            }
            .tag(1)
        BookingView()
                .environmentObject(hotelcore)
            .tabItem {
            VStack{
            Text("Bookings")
            Image(systemName: "books.vertical")
                    }
            }
            .tag(2)
         FavoriteView()
                .environmentObject(userdeafultsHotel)
            .tabItem {
            VStack{
            Text("favorite")
            Image(systemName: "star.fill")
                    }
            }
            .tag(3)
           ProfileView()
            .tabItem {
            VStack{
            Text("Settings")
            Image(systemName: "gear")
                    }
            }
            .tag(4)
            
            
        }
        .accentColor(.purple)
       
            }
            }
        
    
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
