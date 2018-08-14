//
//  ViewController.swift
//  Concentration
//
//  Created by USER on 2018. 8. 4..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else{
            print("chosen card was not in cardButtons")
        }
      
    }
    
    
    func updateViewFromModel(){
        for index in 0..<cardButtons.count{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
        
    }

    //var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    
    var emojiChoices = ["🎃", "👻", "😈", "🤡", "☠️", "💀", "🧠", "🧟‍♂️", "🕸"]
    
    var emoji = [Int : String]()
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        
        } 
        return emoji[card.identifier] ?? "?"
    }
    /*
    func flipCard(withEmoji emoji: String, on Button: UIButton){
        if Button.currentTitle==emoji {
            //Button.setTitle("", for: UIControlState.normal)
            //Button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            //Button.setTitle(emoji, for: UIControlState.normal)
            //Button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }*/

}

