//
//  PurchaseDatabases.swift
//  Books
//
//  Created by zee on 2/1/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
struct PurchaseDatabases: Codable, Identifiable{
    let id = UUID()
    let name: String
    let url: String
    
    public init?(dictionary: [String : Any]){
        guard let purchaseLinkName = (dictionary["name"]) as? String,
            let purchaseLink = (dictionary["url"]) as? String
        else{
            return nil
        }
        self.init(name: purchaseLinkName, url: purchaseLink)
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
