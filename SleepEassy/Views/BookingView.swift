//
//  BookingView.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct BookingView: View {
    @StateObject  var Hotelcoredata = hotelcoredataviewmodel()
    var body: some View {
        NavigationView {
            List{
                ForEach(Hotelcoredata.savedEntity)  { hotel in
                    VStack(spacing:10){
                        HStack{
                            Text("Name")
                            Spacer()
                            Text(hotel.name ?? "")
                        }
                        HStack{
                            Text("HoteName")
                            Spacer()
                            Text(hotel.hotelname ?? "")
                        }
                        HStack{
                            Text("Hotelcheckindate")
                            Spacer()
                            Text("\((hotel.checkindate ?? Date()).formatted(.dateTime.weekday(.abbreviated).day().month(.abbreviated).year().hour().minute()))")
                                .font(.system(size: 10))
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        HStack{
                            Text("Hotelcheckoutdate")
                            Spacer()
                            Text("\((hotel.checkoutdata ?? Date()).formatted(.dateTime.weekday(.abbreviated).day().month(.abbreviated).year().hour().minute()))")
                                .font(.system(size: 10))
                                .font(.subheadline)
                                .foregroundColor(.red)
                        }
                        
                    }
                   
                }
                .onDelete(perform: Hotelcoredata.delete)
                .listStyle(.plain)
            }
            .navigationBarTitle("Bookings📇")
                }
        .onAppear{
            Hotelcoredata.fetchbooking()
      }
           }
         

            }
        
    

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
