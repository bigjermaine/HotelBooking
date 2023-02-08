//
//  HotelCoredata.swift
//  SleepEassy
//
//  Created by Apple on 07/02/2023.
//

import Foundation
import SwiftUI
import CoreData

class hotelcoredataviewmodel:ObservableObject {
    
    ///Create the container of the coredaata
    let container:NSPersistentContainer
    @Published var savedEntity: [HotelEntity] = []
    

    init(){
     ///container of coredata like a storage unit
        container = NSPersistentContainer(name: "HotelContainer")
        container.loadPersistentStores { description, error in
            if let error = error  {
                print(error.localizedDescription)
            }else {
                print("sucess")
            }
        }
        fetchbooking()
    }
    ///fetch the request
    func fetchbooking() {
        let request =  NSFetchRequest<HotelEntity>(entityName: "HotelEntity")
        
        
        do{
            savedEntity = try container.viewContext.fetch(request)
        }catch let error {
            print(error.localizedDescription)
        }
        
    }
    ///add the booking
    func addBooking(Checkindate:Date,Checkoudata:Date,Name:String,Hotelname:String) {
        let newBooking = HotelEntity(context: container.viewContext)
        newBooking.name = Name
        newBooking.hotelname = Hotelname
        newBooking.checkindate = Checkindate
        newBooking.checkoutdata = Checkoudata
        
        saveBooking()
    }
    ///delete the Delete
    func delete(index:IndexSet) {
        guard let index = index.first else {return}
        let entity = savedEntity[index]
        container.viewContext.delete(entity)
        saveBooking()
    }
    ///save the booking 
    func saveBooking() {
        do {
            try  container.viewContext.save()
            fetchbooking()
        }catch{
            print(error.localizedDescription)
        }
    }
}
