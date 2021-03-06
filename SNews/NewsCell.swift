//
//  NewsCell.swift
//  SNews
//
//  Created by Sukhrat on 07.02.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {

    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    
    func configureCell(news: News) {
        
//        let queue = DispatchQueue(label: "com.sukhrat.snews")
//        
//        queue.async {
//            let url = URL(string: news.imageUrl)
//            if let imageData: NSData = NSData(contentsOf: url!) {
//                self.thumbImg.image = UIImage(data: imageData as Data)
//            }
//        }
        thumbImg.sd_setImage(with: URL(string: news.imageUrl), placeholderImage: UIImage(named: "news.png"))
        
        newsTitle.text = news.text
        newsAuthor.text = "By \(news.author)"
        
    }

}
