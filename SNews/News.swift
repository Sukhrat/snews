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
    private var _description: String!
    
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
    
    var description: String {
        
        if self._description == nil {
            self._description = ""
        }
        return self._description
        
    }
    
    init(newsDict: Dictionary<String, AnyObject>) {
        
            
        if let author = newsDict["author"]  as? String {
            self._author = author
        }
            
        if let title = newsDict["title"] as? String {
            self._text = title
        }
            
        if let imageUrl = newsDict["urlToImage"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let description = newsDict["description"] as? String {
            self._description = description
        }
            
        
    }
    
}
