//
//  BooksViewModel.swift
//  Books
//
//  Created by zee on 2/1/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class BooksViewModel : ObservableObject {
    
    @Published var booksData = BookModel()
    
    var selection: FilterType = .title {
        didSet {
            print("Selection changed to \(selection)")
            sortCollectedOn()
        }
    }
    
    init(){
        self.fetchCurrentBooks()
    }
    
    func sortCollectedOn(){
        switch selection {
        case .title:
            booksData.books.sort {$0.title < $1.title}
        case .rank:
            booksData.books.sort {$0.rank < $1.rank}
        case .weeks:
            booksData.books.sort {$0.weeksOnList < $1.weeksOnList}
        }
    }
    
    func fetchCurrentBooks(){
        DataSyncHandler.defaultHandler.fetchAllRecentAlarmsFromServer(urlString: Constants.kCOMPLETE_URL) { (bookModel, success, errorMsg) in
            print(errorMsg)
            if bookModel != nil {
                self.booksData = bookModel!
            }
        }
    }
}
