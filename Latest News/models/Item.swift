//
//  Fact.swift
//  Latest News
//
//  Created by Md Altaf Hoshain Firoj on 7/7/22.
//

import Foundation

struct Item {
    var title: String
    var description: String
    var link: String
    var pubdate:String
    
    init(details: [String: Any]) {
        title = details["title"] as? String ?? ""
        description = details["description"] as? String ?? ""
        link = details["link"] as? String ?? ""
        pubdate = details["pubDate"] as? String ?? ""
    }
}
