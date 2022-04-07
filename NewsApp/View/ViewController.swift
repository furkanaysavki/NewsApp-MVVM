//
//  ViewController.swift
//  NewsApp
//
//  Created by Furkan Ayşavkı on 3.04.2022.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsArray = [Result]()
    private var newsListModel : NewsListViewModel!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
     
        
        
      
        getData()
    }

   
   
    func getData()  {
        NetworkManager.instance.fetch(HTTPMethod.get, url: "https://api.collectapi.com/news/getNews?country=tr&tag=general" , requestModel: nil, model: NewsModel.self ) { response in
            switch(response)
             {
                
            case .success( let model):
            
                let news = model as! NewsModel
                print("JSON RESPONSE MODEL : \(String(describing: news))")
             
                self.newsArray = news.result
                
                self.newsListModel = NewsListViewModel(newsList: self.newsArray)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
                
                
                
            case .failure(_): break
                
            }
            
              
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsListModel == nil ? 0 : self.newsListModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        let newsModel = self.newsListModel.newsAtIndex(index: indexPath.row)
        cell.nameLabel?.text = newsModel.name
        cell.sourceLabel.text = newsModel.source
        cell.descriptionLabel?.text = newsModel.description
        let urlImage = URL(string: newsModel.image)
        cell.newsImageView.af_setImage(withURL: urlImage!)
            
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsModel = self.newsListModel.newsAtIndex(index: indexPath.row)
        if let url = URL(string: newsModel.url) {
            UIApplication.shared.open(url)
        }
    }

}

