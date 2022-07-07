//
//  NetworkingServices.swift
//  Latest News
//
//  Created by Md Altaf Hoshain Firoj on 7/7/22.
//

import Foundation

class NetworkingServices: NSObject, ObservableObject {
    
    var items = [Item]()
    var xmlDict = [String: Any]()
    var xmlDictArr = [[String: Any]]()
    var currentElement = ""

    @Published var newsItems:[NewsItem] = []
    
    func getNewsItems(){
        guard let url = URL(string: ConstantsUtils.RSS_URL) else { return }
           print(url)
           URLSession.shared.dataTask(with: url) { (data, response, error) in
               guard let data = data else {
                   return
               }
               if let httpResponse = response as? HTTPURLResponse {
                 
                   if httpResponse.statusCode == 200 {
                      
                       let parser = XMLParser(data: data)
                       parser.delegate = self
                       parser.parse()
                     
                   } else {
                       print("Response status code not  mathced!")
                   }
                 
               } else{
                   print("No response found!")
               }
            
           }.resume()
       }
    
    
}

extension NetworkingServices: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
           
           //The current parsed tag is presented as `elementName` in this function
           if elementName == "item" {
               xmlDict = [:]
           } else {
               currentElement = elementName
           }
       }

       func parser(_ parser: XMLParser, foundCharacters string: String) {
           
           //The value of current parsed tag is presented as `string` in this function
           if !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
               if xmlDict[currentElement] == nil {
                      xmlDict.updateValue(string, forKey: currentElement)
               }
           }
       }

       func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
           
           //The closing tag is presented as `elementName` in this function
           if elementName == "item" {
               xmlDictArr.append(xmlDict)
           }
       }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        self.items = self.xmlDictArr.map { Item(details: $0) }
        
        var mynews:[NewsItem] = []
        var i = 1
        for item in items {
            mynews.append(NewsItem(id: i, title: item.title, details: item.description,link: item.link,pubdate: item.pubdate))
            i += 1
        }
        
        DispatchQueue.main.async {
            self.newsItems = mynews
        }
        
    }
}
