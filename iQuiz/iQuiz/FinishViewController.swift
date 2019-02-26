//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Keegan Hanes on 2/25/19.
//  Copyright © 2019 Keegan Hanes. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    var getCorrect = Int()
    var getTotal = Int()
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func restartTouch(_ sender: Any) {
        currentQuestion = 0
        numberCorrect = 0
        currentAnswer = 0
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        currentQuestion = 0
        numberCorrect = 0
        currentAnswer = 0
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        currentQuestion = 0
        numberCorrect = 0
        currentAnswer = 0
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        if (getTotal == getCorrect) {
            resultLabel.text = "Perfect!"
            resultLabel.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
        } else if (getCorrect == 0) {
            resultLabel.text = "You Failed."
            resultLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            resultLabel.textColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
            scoreLabel.textColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        } else if (getTotal - getCorrect <= (getTotal / 2)) {
            resultLabel.text = "Good job!"
            resultLabel.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        } else if (getTotal - getCorrect >= (getTotal / 2)) {
            resultLabel.text = "Oof better luck next time :/"
            resultLabel.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        scoreLabel.text = "\(getCorrect) / \(getTotal) correct"
    }
}
