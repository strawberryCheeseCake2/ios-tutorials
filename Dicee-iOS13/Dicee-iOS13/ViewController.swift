//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlet -> refers to UI element
    @IBOutlet var diceImageView1: UIImageView!
    @IBOutlet var diceImageView2: UIImageView!

    var leftDice = 0;
    var rightDice = 5;

    @IBAction func rollButtonePressed(_ sender: UIButton) {
        let diceArray = [
            UIImage(imageLiteralResourceName: "DiceOne"),
            UIImage(imageLiteralResourceName: "DiceTwo"),
            UIImage(imageLiteralResourceName: "DiceThree"),
            UIImage(imageLiteralResourceName: "DiceFour"),
            UIImage(imageLiteralResourceName: "DiceFive"),
            UIImage(imageLiteralResourceName: "DiceSix"),
        ];
        
        // Two ways to generate random number
        diceImageView1.image = diceArray.randomElement();
        diceImageView2.image = diceArray[Int.random(in: 0...5)];
    }
}
