//
//  HomeView.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var hotelviewmodel: Hotelviewmodel
    @State var inputLocation:String = ""
    var body: some View {
   
        
  NavigationView {
  ScrollView{
  VStack(spacing:10) {
  VStack(spacing:20){
 ///Note:Textfield of location
  HStack{
  Image(systemName: "location")
  .font(.system(size: 25))
  .padding()
      TextField("Location", text: $hotelviewmodel.text )
                        }
  
  .modifier(TextfieldModifier())
 .padding(.horizontal)
    ///Note:Button to searchlocation
  Button{
      hotelviewmodel.getdata()
      ///check if there is space on the textfield
      if inputLocation != "" {
          DispatchQueue.main.async {
              
              
              hotelviewmodel.selectedlocation = inputLocation
          }
      }
   }label:{
  Text("Discover")
  }.buttonStyle(.bordered).padding()
    }
                   
                  
                   
   VStack(alignment: .leading){
                            ///Headings
                            Text("BasedLocation")
                                .bold()
                            ScrollView(.horizontal) {
                            HStack{
                            ForEach(hotelviewmodel.Hotelview3, id:\.self) { hotel in
                            NavigationLink(destination: DescriptiveView(hotelmodel: hotel)){
                                        ScrollSection(hotelmodel: hotel)
                                    }
                                }
                            }
                           
                        }
                    }
                   
                        VStack(alignment: .leading){
                            ///Headings
                            Text("Latest")
                                .bold()
                            ScrollView(.horizontal) {
                        HStack{
                        ForEach(hotelviewmodel.Hotelview2, id:\.self) { hotel in
                            NavigationLink(destination: DescriptiveView(hotelmodel: hotel)){
                                ScrollSection(hotelmodel: hotel)
                            }
                                }
                            }
                        }
                    }
                  
                        VStack(alignment: .leading){
                            ///Headings
                            Text("Trending")
                                .bold()
                            ScrollView(.horizontal) {
                            HStack{
                                ForEach(hotelviewmodel.Hotelview, id:\.self) { hotel in
                                    NavigationLink(destination: DescriptiveView(hotelmodel: hotel)){
                                        ScrollSection(hotelmodel: hotel)
                                    }
                                }
                            }
                        }
                    }
                
                }
            }
         .navigationBarTitle("Home🏨")
        }
   
     .navigationViewStyle(.stack)
     
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Hotelviewmodel())
    }
}
