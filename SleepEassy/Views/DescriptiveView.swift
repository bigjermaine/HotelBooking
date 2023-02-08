
//  DescriptiveView.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import SwiftUI

struct DescriptiveView: View {
    @EnvironmentObject var  Hotelcore:hotelcoredataviewmodel
    @EnvironmentObject var userdefaultshotel:UserdeafultsHotel
    @AppStorage("Favorite") var favorite:Bool = false
    var hotelmodel:Result2
    var hotelurl1:URL?
    @State var checkinDate: Date = Date()
    @State var checkoutDate: Date = Date()
    @State var Name: String = ""
    @State private var dataSavedPresented = false
    var body: some View {
        NavigationView{
        ScrollView {
        VStack(spacing:20){
        HStack{
        AsyncImage(url: URL(string:hotelmodel.max_1440_photo_url)!) { image in
            image.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth:.infinity,maxHeight:130)
            .cornerRadius(25)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20){
                    HStack(alignment:.top){
                    Text("HotelName:")
                         
                    Text(hotelmodel.hotel_name)
                        }
                    HStack(alignment:.top){
                    Text("City:")
                    Text(hotelmodel.city)
                        }
                    HStack(alignment:.top){
                    Text("address:")
                           
                    Text(hotelmodel.address)
                        }
                       
                    Link("Click For site Booking", destination: URL(string: hotelmodel.url)!) // 1
                        
                        
                    Button{
                    userdefaultshotel.additem(hotelname: hotelmodel.hotel_name)
                       
                    }label:{
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                        }
                        
                    }
            Divider()
            
            VStack(alignment: .leading){
                Text("Book your hotel with  sleepeassy enter details below")
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                HStack{
                    Text("Name")
                    HStack{
                    TextField("Name", text: $Name )
                           
                    }
                    .frame(width:200,height: 15)
                  
                        
                    }
                
               
                
                HStack{
                    
                    DatePicker(selection:$checkinDate, label: { Text("CheckinDate") })
                }
                HStack{
                    
                    DatePicker(selection:$checkoutDate, label: { Text("CheckoutDate") })
                }
                HStack{
                    Button{
                        withAnimation(.easeInOut) {
                            if Name.isEmpty == false  {
                                
                                Hotelcore.addBooking(Checkindate: checkinDate, Checkoudata: checkoutDate, Name: Name, Hotelname: hotelmodel.hotel_name)
                                dataSavedPresented = true
                            }
                        }
                    }label: {
                        Text("Bookwith SleepEassy")
                    }
                    .buttonStyle(.bordered).padding()
                    Spacer()
                }
            }
            .alert("Hotel Booked!", isPresented: $dataSavedPresented, actions: {
        })
            Divider()
                }
            }
   
        }
        
        .navigationViewStyle(.stack)
    }
    
    ///save userdefaults
    func addtofavorite() {
        userdefaultshotel.additem(hotelname: hotelmodel.hotel_name)
    }
}

struct DescriptiveView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptiveView(hotelmodel:Result2(address: "eee", city: "eee", hotel_name: "eee", hotel_id: 1234, max_1440_photo_url: "eee", url: "eee"))
    }
}
