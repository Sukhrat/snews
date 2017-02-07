//
//  News.swift
//  SNews
//
//  Created by Sukhrat on 07.02.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import Foundation

class News {
    
    private var _author: String!
    private var _text: String!
    private var _title: String!
    private var _imageUrl: String!
    
     var author: String {
    
        if self._author == nil {
            self._author = ""
        }
        return self._author
    }
    
     var text: String {
        if self._text == nil {
            self._text = ""
        }
        
        return self._text
    }
    
     var title: String {
        if self._title == nil {
            self._title = ""
        }
        return self._title
    }
    
     var imageUrl: String {
        if self._imageUrl == nil {
            self._imageUrl = ""
        }
        return self._imageUrl
    }
    
    init(newsDict: Dictionary<String, AnyObject>) {
        
            
        if let author = newsDict["author"]  as? String {
            self._author = author
        }
            
        if let description = newsDict["description"] as? String {
            self._text = description
        }
            
        if let imageUrl = newsDict["urlToImage"] as? String {
            self._imageUrl = imageUrl
        }
            
        
    }
    
}
