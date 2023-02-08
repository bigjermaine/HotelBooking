//
//  ScrollSection.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct ScrollSection: View {
    var hotelmodel:Result2
 
    var body: some View {
        VStack(alignment: .center, spacing:15) {
            Text(hotelmodel.hotel_name )
                .font(.system(size: 10))
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:100)
            ///Used  async images
            HStack{
                AsyncImage(url: URL(string:hotelmodel.max_1440_photo_url)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:100,height:130)
                        .cornerRadius(25)
                } placeholder: {
                    ProgressView()
                }
            }
        }
      
    }
                
}
        
    

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection(hotelmodel:Result2(address: "eee", city: "eee", hotel_name: "eee", hotel_id: 1234, max_1440_photo_url: "eee", url: "eee"))
    }
}
