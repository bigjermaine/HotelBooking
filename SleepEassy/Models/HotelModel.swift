//
//  HotelModel.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI
import Foundation

///Note;Model data creation

struct favorites:Codable,Identifiable {
    let id = UUID()
    var name:String
    
    
    
}


struct hotelmodel:Codable,Hashable,Identifiable {
  let id = UUID()
  let name:String
  let description:String
  let image:String
    
    
    
    
}


let hotelmodelarray = [hotelmodel(name: "wellignton", description: "bigggest hotel in warri", image:"persson"),
                                  hotelmodel(name: "Ecobank", description: "bigggest hotel in warri", image: "person"),
                                  hotelmodel(name: "zenith", description: "bigggest hotel in warri", image: "person"),
                                  hotelmodel(name: "Gtbank", description: "bigggest hotel in warri", image: "person ")]
struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]




struct Response: Codable,Hashable {
    let data: [Results]
    let timestamp: Int
   
    let message: String
}
struct Results: Codable,Hashable {
    let documentId: String?
    let geoId: String?
    let secondaryText: String?
    let title: String?
    let trackingItems: String?
    let image: Images?
}
        struct Images: Codable,Hashable  {
            let __typename: String?
            let maxHeight: Int?
            let maxWidth: Int?
            let urlTemplate: String?
        
    }



struct Country: Codable {
    let dest_id: String
    let dest_type:String
    
    
}
struct region: Codable {
    let dest_id: String
    let dest_type:String
}


struct  Hotel:Codable,Hashable {
    let result:[Result2]
    
    
    
}
struct Result2:Codable,Hashable {

    let address:String
    let city:String
    let hotel_name:String
    let hotel_id:Int
    let max_1440_photo_url:String
    let url:String
    
    
    
}
