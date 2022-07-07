//
//  NewsItemRow.swift
//  Latest News
//
//  Created by Md Altaf Hoshain Firoj on 7/7/22.
//

import SwiftUI

struct NewsItemRow: View {
    
    var newsItem: NewsItem
    
    var body: some View {
        VStack{
            Text(newsItem.title).font(.title).bold()
            Text(newsItem.pubdate).font(.subheadline)
            Text(newsItem.details).font(.body).padding(.top,2)
        }
    }
}

struct NewsItemRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemRow(newsItem: NewsItem(id: 1,title: "Title 1", details: "details 1",link: "",pubdate: ""))
    }
}
