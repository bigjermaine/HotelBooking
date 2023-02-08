//
//  HotelViewList.swift
//  SleepEassy
//
//  Created by Apple on 07/02/2023.
//

import SwiftUI

struct HotelViewList: View {
    var hotelmodel:Result2
    var body: some View {
        HStack {
            Text(hotelmodel.hotel_name )
                .font(.system(size: 10))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading,10)
              Spacer()
            ///Used  async images
            HStack{
                AsyncImage(url: URL(string:hotelmodel.max_1440_photo_url)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:20,height:20)
                        .cornerRadius(25)
                } placeholder: {
                    ProgressView()
                }
            }
            .padding(.trailing,10)
        }
    }
}

struct HotelViewList_Previews: PreviewProvider {
    static var previews: some View {
        HotelViewList(hotelmodel:Result2(address: "eee", city: "eee", hotel_name: "eee", hotel_id: 1234, max_1440_photo_url: "eee", url: "eee"))
    }
}
