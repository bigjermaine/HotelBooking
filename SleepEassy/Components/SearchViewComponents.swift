//
//  SearchViewComponents.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct SearchViewComponents: View {
 
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var hotelviewmodel: Hotelviewmodel
        var body: some View {
            NavigationView {
            List {
            ForEach(hotelviewmodel.Hotelview3.filter {
            $0.hotel_name.contains(text) || text == ""
                    },id:\.self)
                    {  item in
                       ScrollSection(hotelmodel: item)
                        
                    }
                    
                }
                .searchable(text: $text,placement:
                .navigationBarDrawer(displayMode:.always),prompt: Text("jermaine")) { ForEach(suggestions) { suggestion in
                            Button {
                                text = suggestion.text
                            } label: {
                                Text(suggestion.text)
                                    .searchCompletion(suggestion.text)
                            }
                            
                        }
                        }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            
           .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Done").bold() })
        }
    }


struct SearchViewComponents_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewComponents()
            .environmentObject(Hotelviewmodel())
    }
}
