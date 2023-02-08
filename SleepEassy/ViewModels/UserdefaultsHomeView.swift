//
//  UserdefaultsHomeView.swift
//  SleepEassy
//
//  Created by Apple on 07/02/2023.
//

import SwiftUI
import Foundation



class UserdeafultsHotel: ObservableObject {
    var defaultadata:String = "favorite"
    @Published var Favorites:[favorites] = [] {
        didSet{
            saveitems()
        }
        
        
    }
    
    init() {
        getitems()
    }
    
    
    func getitems() {
        guard let data = UserDefaults.standard.data(forKey: defaultadata) ,
        let saveditems = try? JSONDecoder().decode([favorites].self, from: data) else { return}
        self.Favorites = saveditems
    }
    
    
    
    
    func deleteitems(indexSet:IndexSet) {
        Favorites.remove(atOffsets: indexSet)
        
    }
    
    
    func moveitems(from:IndexSet, to:Int ) {
        Favorites.move(fromOffsets:from , toOffset: to)
    }
    
    
    func additem(hotelname:String) {
        let newitem = favorites(name: hotelname)
        Favorites.append(newitem)
    }
    
    func saveitems() {
        if let encodeData = try? JSONEncoder().encode(Favorites) {
            UserDefaults.standard.set(encodeData, forKey: defaultadata)
        }
    }
}
