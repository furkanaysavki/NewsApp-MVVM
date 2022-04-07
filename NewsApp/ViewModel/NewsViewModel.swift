//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Furkan Ayşavkı on 4.04.2022.
//

import Foundation

struct NewsListViewModel {
    
    let newsList : [Result]
    func numberOfRowsInSection() -> Int {
        
        return self.newsList.count
    }
    func newsAtIndex( index : Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
        
    }
}
struct NewsViewModel {
        let news : Result
    var name : String {
        return news.name
    }
    var description : String {
        return news.resultDescription
    }
    var source : String {
        return news.source
    }
    var image : String {
        return news.image
    }
    var url : String {
        return news.url
    }
    }
    

