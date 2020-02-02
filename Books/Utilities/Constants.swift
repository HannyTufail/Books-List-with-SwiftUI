//
//  Constants.swift
//  Books
//
//  Created by zee on 1/28/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation

struct Constants {
    
    // Sub-components to fetch Books list from New York Times
    static let kPING_URL = "https://developer.nytimes.com/"
    static let kBOOK_BASE_URL = "https://api.nytimes.com/svc/books/v3"
    static let kBOOK_LIST_DATE = "/lists/current"
    static let kBOOK_LIST_TYPE = "/combined-print-and-e-book-fiction.json?api-key="
    static let kAPI_KEY = "3GiIylwhoiL0USYYl7IIMDwjqe5FNtqR"
    
    static let kCOMPLETE_URL = "\(Constants.kBOOK_BASE_URL)"+"\(Constants.kBOOK_LIST_DATE)"+"\(Constants.kBOOK_LIST_TYPE)"+"\(Constants.kAPI_KEY)"
    
    static let kSERVER_RESPONSE_SUCCESS = "OK"
    static let kSERVER_RESPONSE_ERROR = "ERROR"
    static let kNETWORK_ERROR = "Internet connection error, please check your network connection settings and try again."
    static let  KGENERIC_ERROR = "An error has occured."
    static let  KMALFORMED_DATA_RECEIVED = "Malformed data received from fetchAllAlarms service"
}
