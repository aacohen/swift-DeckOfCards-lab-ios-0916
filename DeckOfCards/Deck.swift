//
//  Deck.swift
//  DeckOfCards
//
//  Created by Ariela Cohen on 11/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var apiClient = CardAPIClient.shared
    
    var cards: [Card] = []
    var success: Bool!
    var deck_id: String!
    var shuffled: Bool!
    var remaining: Int!
    
    func newDeck(_ completeion:(Bool) -> Void ) {
        apiClient.newDeckShuffled { (resultDict) in
            self.success = resultDict["success"] as! Bool!
            self.deck_id = resultDict["deck_id"] as! String!
            self.shuffled = resultDict["shuffled"] as! Bool!
            self.remaining = resultDict["remaining"] as! Int!
        }
        completeion(true)
    }
    
    func drawCards(numberOfCards count: Int , completion: @escaping (Bool,[Card]?) -> Void) {
        if count <= remaining {
            apiClient.drawCards(deck_id: deck_id, completion: { (arrayofDict) in
                for dict in arrayofDict {
                  let newCard = Card(dictionary: dict)
                    self.cards.append(newCard)
                }
                completion(true, self.cards)
            })
        }
    }
}
