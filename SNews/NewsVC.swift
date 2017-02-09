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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: self.news.imageUrl)
        if let imageData: NSData = NSData(contentsOf: url!) {
            self.newsImg.image = UIImage(data: imageData as Data)
        }
        newsTitle.text = news.title
        authorLbl.text = news.author
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
   
}
