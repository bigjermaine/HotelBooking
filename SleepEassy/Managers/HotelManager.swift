//
//  HotelManager.swift
//  SleepEassy
//
//  Created by Apple on 06/02/2023.
//

import Foundation
import Combine


    ///Network Manager Class
   class HotelNetworkManger:ObservableObject {
       
   static let shared = HotelNetworkManger()
    
    ///function for fetchimg basedonlocation
    func fetch ( completion: @escaping (Result<Country, Error>) ->  Void ) {
        
        
        ///Note:used headers because of the the typeof http request
        let headers = [
            "X-RapidAPI-Key": "8ae2db77c5mshed0ff4191967094p183ea0jsn7aae9fccaf82",
            "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
        ]
        ///get the request of the api
        var request = URLRequest(url: URL(string:  "https://booking-com.p.rapidapi.com/v1/hotels/locations?locale=en-gb&name=\(UserDefaults.standard.getValue(key: "Location"))")!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
      //  print(headers)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
        ///check if the error is nil before using the data
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
             //   print(httpResponse!)
                if let data = data {
                do {
                        ///for printing of the json data
                        /// let json = try JSONSerialization.jsonObject(with: data, options: [])
                      /// print(json)
                let results = try JSONDecoder().decode([Country].self,from: data)

                completion(.success(results[1]))
                    } catch {
                        print(error)
                    }
                }
                
            }
            
        })
        
        dataTask.resume()
    }
    
    ///function for fetchimg latest
    func Latest (query:String,query2:String, completion: @escaping (Result<[Result2], Error>) ->  Void ) {
        
        
        let headers = [
            "X-RapidAPI-Key": "8ae2db77c5mshed0ff4191967094p183ea0jsn7aae9fccaf82",
            "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
        ]
        
      var request = URLRequest(url: URL(string:  "https://booking-com.p.rapidapi.com/v1/hotels/search?dest_id=\(query)&order_by=popularity&filter_by_currency=AED&adults_number=2&room_number=1&checkout_date=2023-07-16&units=metric&checkin_date=2023-07-15&dest_type=\(query2)&locale=en-gb&children_ages=5%2C0&categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&page_number=0&include_adjacency=true&children_number=2")!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else  {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                if let data = data {
                    do {
                         
                        
                        let results = try JSONDecoder().decode(Hotel.self,from: data)

                        completion(.success(results.result))
                        
                        
                    } catch {
                        print(error)
                    }
                }
                
            }
            
        })
        
        dataTask.resume()
    }
       
       
       ///function for the latest and trending 
       func fetch2 (query:String, completion: @escaping (Result<Country, Error>) ->  Void ) {
           
           
           ///Note:used headers because of the the typeof http request
           let headers = [
               "X-RapidAPI-Key": "8ae2db77c5mshed0ff4191967094p183ea0jsn7aae9fccaf82",
               "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
           ]
           ///get the request of the api
           var request = URLRequest(url: URL(string:  "https://booking-com.p.rapidapi.com/v1/hotels/locations?locale=en-gb&name=\(query)")!,
                                             cachePolicy: .useProtocolCachePolicy,
                                             timeoutInterval: 10.0)
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headers
           //print(headers)
           let session = URLSession.shared
           let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
               
           ///check if the error is nil before using the data
               if (error != nil) {
                   print(error!)
               } else {
                   let httpResponse = response as? HTTPURLResponse
                   print(httpResponse!)
                   if let data = data {
                       do {
                           ///for printing of the json data
                          //  let json = try JSONSerialization.jsonObject(with: data, options: [])
                       // print(json)
                         let results = try JSONDecoder().decode([Country].self,from: data)
                           DispatchQueue.main.async {
                               completion(.success(results[1]))
                           }
                       } catch {
                           print(error)
                       }
                   }
                   
               }
               
           })
           
           dataTask.resume()
       }
}
