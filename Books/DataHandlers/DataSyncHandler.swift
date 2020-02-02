//
//  DataSyncHandler.swift
//  Books
//
//  Created by zee on 1/28/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//


/*
 Since Alamofire is very often used, well maintained framework with less code on developer's end that is why I prefer not on reinvent the wheel here.
 */

import Foundation
import Alamofire

class DataSyncHandler: ObservableObject {
    static let defaultHandler = DataSyncHandler()
    
    func fetchAllRecentAlarmsFromServer(urlString:String,completion:@escaping (_ responseObject: BookModel?, _ success:Bool, _ errorMsg:String)-> Void)  {
        if Reachability.checkReachable.isConnectedToNetwork() {
            
            guard let url = URL(string: urlString) else {
                return
            }
            
            Alamofire.request(
                url,
                method: .get)
                .validate()
                .responseJSON { response in
//                                        print(response.request)  // original URL request
//                                        print(response.response) // URL response
//                                        print(response.data)     // server data
//                                        print(response.result.value)   // result of response serialization
                    
                    guard response.result.isSuccess else {
                        print("Error while fetching Books: \(String(describing: response.result.error))") // Failure Case
                        return
                    }
                    guard let value = response.result.value as? [String: Any],
                        let status = value["status"] as? String,
                        let bookResultsDict = value["results"] as? [String: Any]
                        else {
                            print(Constants.KMALFORMED_DATA_RECEIVED)
                            return
                    }
                    if status  == Constants.kSERVER_RESPONSE_SUCCESS { // "OK"
                        
                        let bookModel = BooksFactory.defaultFactory.makeBooksModel(from: bookResultsDict)
                        completion(bookModel, true, "")
                        
                    } else if status  == Constants.kSERVER_RESPONSE_ERROR { // "ERROR"
                        let errorsList = value["errors"] as? [String]
                        let errorMessage = errorsList?.first ?? Constants.KGENERIC_ERROR
                        print(errorMessage)
                        completion(nil,false,errorMessage)
                    }
            }
        }else {
            let jsonString = (Constants.kNETWORK_ERROR)
            completion(nil,false,jsonString)
        }
    }
}
