//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Marvin Sagastume on 9/29/18.
//  Copyright © 2018 Innovaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterGuessTextBox: UITextField!
    @IBOutlet weak var enterGuessButton: UIButton!
    @IBOutlet weak var guessResultLabel: UILabel!
    
    var fingersHeldUp = arc4random_uniform(6)
    
    @IBAction func enterGuess(_ sender: UIButton) {
        if enterGuessTextBox.text == "" {
            guessResultLabel.text = "Please enter a value!"
        }
        else if Int(enterGuessTextBox.text!) == nil
        {
            guessResultLabel.text = "Please enter an integer!"
        }
        else if Int(enterGuessTextBox.text!)! > 5 || Int(enterGuessTextBox.text!)! < 0
        {
            guessResultLabel.text = "Please enter an integer between 0 and 5!"
        }
        else
        {
            let integerGuess = Int(enterGuessTextBox.text!)!;
            if integerGuess == fingersHeldUp {
                guessResultLabel.text = "You're right!"
            }
            else
            {
                guessResultLabel.text = "You're wrong! The number was " + String(fingersHeldUp) + "!"
            }
            
            setNewNumberOfFingersHeldUp()
        }
    }
    
    // sets the number of fingers held up to a new number between 0 and 5 (inclusive for both)
    func setNewNumberOfFingersHeldUp() {
        fingersHeldUp = arc4random_uniform(6)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
