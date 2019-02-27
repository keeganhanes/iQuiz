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
    var getCurrentQuiz = String()
    var getCurrentQuestion = Int()
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var usersAnswer: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBAction func nextTouch(_ sender: Any) {
        if (quizData[currentQuizNumber].questions.count <= getCurrentQuestion) {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let finishVC = storyboard.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            finishVC.getCorrect = numberCorrect
            finishVC.getTotal = quizData[currentQuizNumber].questions.count
            self.navigationController?.pushViewController(finishVC, animated: true)
        } else {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let questionVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            questionVC.getQuiz = quizData[currentQuizNumber].title
            self.navigationController?.pushViewController(questionVC, animated: true)
        }
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        if (quizData[currentQuizNumber].questions.count <= getCurrentQuestion) {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let finishVC = storyboard.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            finishVC.getCorrect = numberCorrect
            finishVC.getTotal = quizData[currentQuizNumber].questions.count
            self.navigationController?.pushViewController(finishVC, animated: true)
        } else {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let questionVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            questionVC.getQuiz = quizData[currentQuizNumber].title
            self.navigationController?.pushViewController(questionVC, animated: true)
        }
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
        if (getAnswer == getCorrectAnswer) {
            results.text = "Correct!"
            results.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
            numberCorrect = numberCorrect + 1
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
