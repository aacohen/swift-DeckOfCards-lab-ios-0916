//
//  CardAPIClient.swift
//  DeckOfCards
//
//  Created by Ariela Cohen on 11/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit

struct CardAPIClient {
    
    static let shared = CardAPIClient()
    
    func newDeckShuffled(_ completion: @escaping ([String:Any]) -> Void) {
        let stringUrl = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        let url = URL(string: stringUrl)
        guard let unwrappedUrl = url else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            guard let data = data else { return }
            
            do { let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                completion(jsonResult)
            }catch{
                
            }
           
        }.resume()
    }
    
    func drawCards(deck_id: String, completion: @escaping ([[String:String]] ) -> Void) {
        
        let stringURL = "https://deckofcardsapi.com/api/deck/\(deck_id)/draw/?count=2"
        let url = URL(string: stringURL)
        guard let unwrappedURL = url else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: unwrappedURL) { (data, response, error) in
            guard let data = data else { return }
            
            do{ let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
               
                let allTheCards = jsonData["cards"] as! [[String : String]]
                
                completion(allTheCards)
               
//                for dictionary in allTheCards {
//                    
//                    let newCard = Card(dictionary: dictionary)
//                
//                    // completion(card)
//                }
                
               
            }catch{
                
            }
        }.resume()
    }
    
    func downloadImage(at url: URL, completion: @escaping (Bool, UIImage?) -> Void) {
        var request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            let image = data as! UIImage
            
            completion(true, image)
        }.resume()
        
    }
    
}














