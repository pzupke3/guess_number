//
//  ViewController.swift
//  Guess The Number
//
//  Created by Peter Zupke on 9/6/16.
//  Copyright © 2016 Peter Zupke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessLabel: UILabel!

    @IBOutlet weak var guessTextField: UITextField!
    
    //Variables
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess : Int!
    var numberOfGuess = 0
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                validateGuess(guessInt)
                numberOfGuess = numberOfGuess + 1
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        if (guess < lowerBound || guess > upperBound) {
            showBoundsAlert()
        } else if (guess > numberToGuess) {
            guessLabel.text = "Lower! 🔽"
        } else if (guess < numberToGuess) {
            guessLabel.text = "Higher! 🔼"
        } else {
            showWinAlert()
            guessLabel.text = "Guess The Number"
            numberOfGuess = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congratulations! 🎉", message: "You guessed the correct number!", preferredStyle: .alert)
        let action = UIAlertAction(title: "New Game", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

