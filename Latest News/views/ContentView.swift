//
//  ContentView.swift
//  Latest News
//
//  Created by Md Altaf Hoshain Firoj on 7/6/22.
//

import SwiftUI

struct ContentView: View {
   
    @ObservedObject var networkingService = NetworkingServices()
    
    var body: some View {
        NavigationView{
            List(self.networkingService.newsItems){ news in
                NavigationLink {
                    DetailsView(news: news) 
                } label: {
                    NewsItemRow(newsItem: news)
                }
            }
        }.navigationTitle("News")
            .onAppear{
                self.networkingService.getNewsItems()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
