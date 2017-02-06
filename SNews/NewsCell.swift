//
//  NewsCell.swift
//  SNews
//
//  Created by Sukhrat on 07.02.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    func configureCell(news: News) {
        
        
        newsTitle.text = news.text
        newsAuthor.text = "By \(news.author)"
        
    }

}
