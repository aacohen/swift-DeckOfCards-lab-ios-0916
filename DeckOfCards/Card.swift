//
//  Card.swift
//  DeckOfCards
//
//  Created by Ariela Cohen on 11/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit

class Card {
    let imageURLString: String
    let url: URL?
    let code: String
    var image: UIImage?
    let value: String
    let suit: String
    let apiClient = CardAPIClient.shared
    var isDownloading = false
    
    
    init(dictionary: [String: String]){
        
        imageURLString = dictionary["image"] ?? "No Image"
        url = URL(string: imageURLString)
        code = dictionary["code"] ?? "no code"
        value = dictionary["value"] ?? "no value"
        suit = dictionary["suit"] ?? "no suit"
        
    }
    
    func downloadImage(completion: @escaping (Bool) ->Void) {
        
        guard let unwrappedUrl = url else { return }
        apiClient.downloadImage(at: unwrappedUrl) { (true, image) in
            self.image = image
            
            completion(true)
        }
    }
}
