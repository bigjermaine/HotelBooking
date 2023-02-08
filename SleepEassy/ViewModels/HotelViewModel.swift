//
//  HotelViewModel.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import Foundation
import Combine



class Hotelviewmodel:ObservableObject {
    
    static let userDefaultTextKey = "Location"
    @Published var text = UserDefaults.standard.string(forKey: Hotelviewmodel.userDefaultTextKey) ?? ""
    private var canc: AnyCancellable!
    @Published private(set) var videos: [Results] = []
    @Published var searchtext: String = ""
    @Published var Hotelview:[Result2] = []
    @Published var Hotelview2:[Result2] = []
    private var  cancellables =  Set<AnyCancellable>()
    @Published var Hotelview3:[Result2] = []
    var country1:String = "spain"
    var country2:String = "london"
    @Published var selectedlocation:String  = "nigeria"{
        
        //   Once the selectedlocation variable is set, we'll call the API again
        didSet{
            
            // getsearchdata(serach:selectedlocation)
            
        }
    }
    
    init()
    {
        getdata2(Country:country1)
        
        getdata3(Country:country2)
        
        fetch()
        
        canc = $text.debounce(for: 0.5, scheduler: DispatchQueue.main).sink { newText in
            UserDefaults.standard.set(newText, forKey: Hotelviewmodel.userDefaultTextKey)
        }
        ///pass the function on the initialize do the function can capture it for ever launch
        getdata()
    }
    deinit {
        canc.cancel()
    }
    
    func getdata(){
        HotelNetworkManger.shared.fetch { results in
            
            switch results {
            case.success(let titles):
            HotelNetworkManger.shared.Latest(query: titles.dest_id, query2: titles.dest_type) { [weak self] results in
            switch results {
            case.success(let titles2):
            DispatchQueue.main.async {
            self?.Hotelview3 = titles2
                    }
            case.failure(let error):
            print(error.localizedDescription)
                    }
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    func getdata2(Country:String){
        HotelNetworkManger.shared.fetch2(query: country2) { results in
            
             switch results {
             case.success(let titles):
             HotelNetworkManger.shared.Latest(query: titles.dest_id, query2: titles.dest_type){ [weak self] results in
             switch results {
             case.success(let titles3):
             DispatchQueue.main.async {
             self?.Hotelview =  titles3
                            
                        }
             case.failure(let error):
              print(error.localizedDescription)
                    }
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    func getdata3(Country:String){
        HotelNetworkManger.shared.fetch2(query: country1) { results in
            
            switch results {
            case.success(let titles):
            HotelNetworkManger.shared.Latest(query: titles.dest_id, query2: titles.dest_type){ [weak self] results in
            switch results {
            case.success(let titles3):
            DispatchQueue.main.async {
            self?.Hotelview2 =  titles3
                        }
            case.failure(let error):
            print(error.localizedDescription)
                    }
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    func fetch () {
        $searchtext
        .combineLatest($Hotelview3)
        .map { (text, startingcoin) -> [Result2]  in
         guard !text.isEmpty else {
         return startingcoin
                }
                
          let  lowercasedText = text.lowercased()
          return startingcoin.filter { (coin) -> Bool in
          return coin.hotel_name.lowercased().contains(lowercasedText) ||
          coin.address.lowercased().contains(lowercasedText) ||
          coin.city.lowercased().contains(lowercasedText)
                }
                
            }
            .sink { [weak self]  (returnedCoins) in
                self?.Hotelview3 = returnedCoins
                
            }
        
            .store(in: &cancellables)
    }
}




class Searchviewmodel:ObservableObject {
    
    private let hotelviewmodel = Hotelviewmodel()
    @Published var searchtext: String = ""
    private var  cancellables =  Set<AnyCancellable>()
    @Published var Hotelview3:[Result2] = []
    
    init() {
        hotelviewmodel.$Hotelview3
        fetch()
    }
    
    func fetch () {
        $searchtext
        .combineLatest(hotelviewmodel.$Hotelview3)
        .map { (text, startingcoin) -> [Result2]  in
        guard !text.isEmpty else {
        return startingcoin
          }
        let  lowercasedText = text.lowercased()
        return startingcoin.filter { (coin) -> Bool in
        return coin.hotel_name.lowercased().contains(lowercasedText) ||
        coin.city.lowercased().contains(lowercasedText) ||
        coin.city.lowercased().contains(lowercasedText)
                }
                
            }
         .sink { [weak self]  (returnedCoins) in
         self?.Hotelview3 = returnedCoins
                
            }
        .store(in: &cancellables)
    }
}
