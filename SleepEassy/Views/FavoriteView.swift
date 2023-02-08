//
//  FavoriteView.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct FavoriteView: View {
@StateObject  var userdeafultsHotel =  UserdeafultsHotel()
    var body: some View {
        NavigationView {
            List{
                ForEach(userdeafultsHotel.Favorites) { item in
                    HStack(spacing:10) {
                        Text(item.name)
                        Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                    }
                    }
                
                  ///delete items on the list
                  .onDelete(perform: userdeafultsHotel.deleteitems)
                ///move items on the list
                  .onMove(perform: userdeafultsHotel.moveitems)
                  }
                .listStyle(.plain)
                .navigationBarTitle("Favorites🏆")
                }
         .onAppear{
             userdeafultsHotel.getitems()
           }
          
          .navigationViewStyle(.stack)
            }
         
        }


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
