//
//  SearchView.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var hotelviewmodel: Hotelviewmodel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                SearchBarView(searchtext: $hotelviewmodel.searchtext)
                
                
                List {
                    ForEach(hotelviewmodel.Hotelview3, id:\.self) { hotel in
                        NavigationLink(destination: DescriptiveView(hotelmodel: hotel)){
                             HotelViewList(hotelmodel: hotel)
                        }
                    }
                }
            }
            .navigationBarTitle("Search🔦")
        }
        .onAppear {
            hotelviewmodel.getdata()
        }
       
        .navigationViewStyle(.stack)
    }
        
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(Hotelviewmodel())
    }
}
