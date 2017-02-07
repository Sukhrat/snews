//
//  ViewController.swift
//  SNews
//
//  Created by Sukhrat on 06.02.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var latestNewsImg: UIImageView!
    
    @IBOutlet weak var latestAuthor: UILabel!
    @IBOutlet weak var latestTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var newsArticles = [News]()
    
    private var latestNews: LatestNews!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //why we should initialize it again?
        latestNews = LatestNews()
            self.downloadLatestNews() {
                //find
                self.latestNews.downloadLatest {
                    self.updateMainUI()
                }
            
        }
        
            
        
    }
    
    func downloadLatestNews(completed: @escaping DownloadComplete) {
        
        let url = "\(BASE_URL)\(API_KEY)"
        Alamofire.request(url).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let articles = dict["articles"] as? [Dictionary<String, AnyObject>] {
                    for article in articles {
                        let news = News(newsDict: article)
                        self.newsArticles.append(news)
                        
                    }
                    self.newsArticles.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell {
            let news = newsArticles[indexPath.row]
            cell.configureCell(news: news)
            return cell
        }
        return NewsCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func updateMainUI() {
        let url = URL(string: self.latestNews.imageUrl)
        if let imageData: NSData = NSData(contentsOf: url!) {
            latestNewsImg.image = UIImage(data: imageData as Data)
        }
        self.latestTitle.text = self.latestNews.description
        self.latestAuthor.text = self.latestNews.author
        
    }

}

