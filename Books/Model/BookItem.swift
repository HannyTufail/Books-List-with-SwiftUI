//
//  BookItem.swift
//  Books
//
//  Created by zee on 2/1/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
// A basic information of a Book Item fetched from NewYork Times

struct BookItem : Codable, Identifiable{
   
    let id = UUID()
    let title: String
    let author: String
    let imageURL : String
    let description: String
    let publisher: String
    let rank: Int
    let rankLastWeek : Int
    let weeksOnList: Int
    let purchaseLinks: [PurchaseDatabases]
    
    public init?(dictionary: [String : Any]){
        guard let bookTitle = (dictionary["title"]) as? String,
            let authorName = (dictionary["author"]) as? String,
            let bookImage = (dictionary["book_image"]) as? String,
            let bookDesc = (dictionary["description"]) as? String,
            let bookPubName = (dictionary["publisher"]) as? String,
            let bookRank = (dictionary["rank"]) as? Int,
            let bookWeekRank = (dictionary["rank_last_week"]) as? Int,
            let weekNumOnList = (dictionary["weeks_on_list"]) as? Int,
            let purchaseDB = (dictionary["buy_links"]) as? [[String : String]]
        else{
            return nil
        }
        self.init(title: bookTitle, author: authorName, imageURL: bookImage, description: bookDesc, publisher: bookPubName, rank:bookRank, rankLastWeek: bookWeekRank, weeksOnList: weekNumOnList, purchaseLinks: purchaseDB)
    }
    
    init(title: String, author: String, imageURL: String, description: String,  publisher: String, rank: Int, rankLastWeek: Int, weeksOnList: Int, purchaseLinks: [[String : String]]) {
        self.title = title
        self.author = author
        self.imageURL = imageURL
        self.description = description
        self.publisher = publisher
        self.rank = rank
        self.rankLastWeek = rankLastWeek
        self.weeksOnList = weeksOnList
        self.purchaseLinks = purchaseLinks.compactMap { linkDict in
            return PurchaseDatabases(dictionary: linkDict)
        }
    }
    
    init(){
        title = ""
        author = ""
        imageURL = ""
        description = ""
        publisher = ""
        rank = 0
        rankLastWeek = 0
        weeksOnList = 0
        purchaseLinks =  [PurchaseDatabases]()
    }
}
