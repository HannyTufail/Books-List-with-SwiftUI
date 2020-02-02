//
//  BooksFactory.swift
//  Books
//
//  Created by zee on 2/1/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
public class BooksFactory {
    
    static let defaultFactory = BooksFactory()
    
    func makeBooksModel(from resultObject: [String: Any]) -> BookModel? {
        var booksListData: BookModel?
        if let bookModel = BookModel(dictionary: resultObject){
            booksListData = bookModel
        }else{
            booksListData = nil
        }
        return booksListData
    }
}
