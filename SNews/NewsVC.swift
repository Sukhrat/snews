//
//  NewsVC.swift
//  SNews
//
//  Created by Sukhrat on 09.02.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var descriptionSV: UIScrollView!
    var news: News!
    var latestNews: LatestNews!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = URL(string: self.news.imageUrl)
//        if let imageData: NSData = NSData(contentsOf: url!) {
//            self.newsImg.image = UIImage(data: imageData as Data)
//        }
        if (news != nil) {
            newsImg.sd_setImage(with: URL(string: news.imageUrl), placeholderImage: UIImage(named: "news.png"))
            newsTitle.text = news.text
            authorLbl.text = "By \(news.author)"
            descriptionText.text = news.description
        }
        if (latestNews != nil) {
            newsImg.sd_setImage(with: URL(string: latestNews.imageUrl), placeholderImage: UIImage(named: "news.png"))
            newsTitle.text = latestNews.title
            authorLbl.text = "By \(latestNews.author)"
            descriptionText.text = latestNews.description
        }
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
   
}
