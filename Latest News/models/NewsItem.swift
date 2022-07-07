//
//  NewsItem.swift
//  Latest News
//
//  Created by Md Altaf Hoshain Firoj on 7/7/22.
//

import Foundation
import SwiftUI

struct NewsItem: Identifiable {
    var id:Int
    var title:String = ""
    var details:String = ""
    var link:String = ""
    var pubdate:String = ""
}
