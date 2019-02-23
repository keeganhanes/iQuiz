//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Keegan Hanes on 2/22/19.
//  Copyright © 2019 Keegan Hanes. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    var getAnswer = Int()
    var getAnswerText = String()
    var getCorrectAnswer = Int()
    var getCorrectAnswerText = String()
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var usersAnswer: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBAction func nextTouch(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (getAnswer == getCorrectAnswer) {
            results.text = "Correct!"
            results.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
        } else {
            results.text = "Incorrect!"
            results.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            usersAnswer.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            correctAnswer.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            results.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            usersAnswer.text = "Your answer: \(getAnswerText)"
            correctAnswer.text = "Correct answer: \(getCorrectAnswerText)"
            usersAnswer.isHidden = false
            correctAnswer.isHidden = false
        }
    }
}
