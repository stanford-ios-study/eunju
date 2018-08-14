//
//  Card.swift
//  Concentration
//
//  Created by USER on 2018. 8. 12..
//  Copyright © 2018년 USER. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
