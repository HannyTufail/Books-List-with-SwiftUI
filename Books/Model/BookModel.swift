//
//  BookModel.swift
//  Books
//
//  Created by zee on 1/28/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
import SwiftUI

struct BookModel: Codable{
    
    var books: [BookItem]
    let displayName: String
    let publishedDate : String

    public init?(dictionary: [String : Any]){
        guard
            let bookItemList = (dictionary["books"]) as? [[String: Any]],
            let name = (dictionary["display_name"]) as? String,
            let pubDate = (dictionary["previous_published_date"]) as? String
        else{
            return nil
        }
        self.init(bookItemsDictArray: bookItemList, displayName: name, publishedDate: pubDate)
    }
    
    init(bookItemsDictArray: [[String : Any]], displayName: String, publishedDate: String) {
        self.books = bookItemsDictArray.compactMap { bookDict in
            return BookItem(dictionary: bookDict)
        }
        self.displayName = displayName
        self.publishedDate = publishedDate
    }
    init(){
        self.books = []
        self.displayName = "displayName"
        self.publishedDate = "publishedDate"
    }
}
