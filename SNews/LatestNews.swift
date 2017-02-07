//
//  LatestNews.swift
//  SNews
//
//  Created by Sukhrat on 07.02.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import Foundation
import Alamofire

class LatestNews {
    
    private var _author: String!
    private var _title: String!
    private var _description: String!
    private var _imageUrl: String!
    
    var author: String {
        
        if self._author == nil {
            self._author = ""
        }
        return self._author
    }
    
    var description: String {
        if self._description == nil {
            self._description = ""
        }
        
        return self._description
    }
    
    var title: String {
        if self._title == nil {
            self._title = ""
        }
        return self._title
    }
    
    var imageUrl: String {
        if self._imageUrl == nil {
            self._imageUrl = "https://storage.googleapis.com/gweb-uniblog-publish-prod/static/blog/images/google-200x200.7714256da16f.png"
        }
        return self._imageUrl
    }

    
    func downloadLatest(complete: @escaping DownloadComplete) {
        let url = "\(BASE_URL)\(API_KEY)"
        Alamofire.request(url).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let articles = dict["articles"] as? [Dictionary<String, AnyObject>] {
                    if let latest = articles[0] as? Dictionary<String, AnyObject> {
                        
                        if let author = latest["author"] as? String {
                            self._author = author
                        }
                        if let description = latest["description"] as? String {
                            self._description = description
                        }
                        if let title = latest["title"] as? String {
                            self._title = title
                        }
                        if let imageUrl = latest["urlToImage"]  as? String {
                            self._imageUrl = imageUrl
                        } else {
                            //self._imageUrl = URL(string: "https://storage.googleapis.com/gweb-uniblog-publish-prod/static/blog/images/google-200x200.7714256da16f.png")
                        }
                        
                    }
                }
                
            }
            complete()

    
        }
    }
}
