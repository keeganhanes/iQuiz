//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Keegan Hanes on 2/22/19.
//  Copyright © 2019 Keegan Hanes. All rights reserved.
//

import UIKit

var currentAnswer : Int = 0
var currentAnswerText : String = ""
var correctAnswer : Int = 0
var correctAnswerText : String = ""
var currentQuiz : String = ""
var currentQuestion : Int = 0
var numberCorrect : Int = 0
var currentQuizNumber : Int = -1

class QuestionViewController: UIViewController {
    var getQuiz = String()
    @IBAction func submitTouch(_ sender: Any) {
        if (currentAnswer != 0) {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let answerVC = storyboard.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
            answerVC.getAnswer = currentAnswer
            answerVC.getAnswerText = currentAnswerText
            answerVC.getCorrectAnswer = correctAnswer
            answerVC.getCorrectAnswerText = correctAnswerText
            answerVC.getCurrentQuiz = currentQuiz
            answerVC.getCurrentQuestion = currentQuestion
            self.navigationController?.pushViewController(answerVC, animated: true)
        }
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        if (currentAnswer != 0) {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let answerVC = storyboard.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
            answerVC.getAnswer = currentAnswer
            answerVC.getAnswerText = currentAnswerText
            answerVC.getCorrectAnswer = correctAnswer
            answerVC.getCorrectAnswerText = correctAnswerText
            answerVC.getCurrentQuiz = currentQuiz
            answerVC.getCurrentQuestion = currentQuestion
            self.navigationController?.pushViewController(answerVC, animated: true)
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
    
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBAction func answer1Touch(_ sender: Any) {
        answer1.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
        answer1.layer.borderWidth = 2.0
        if (currentAnswer == 2) {
            answer2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer2.layer.borderWidth = 0.0
        } else if (currentAnswer == 3) {
            answer3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer3.layer.borderWidth = 0.0
        } else if (currentAnswer == 4) {
            answer4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer4.layer.borderWidth = 0.0
        }
        currentAnswer = 1
        currentAnswerText = answer1.currentTitle!
    }
    @IBOutlet weak var answer2: UIButton!
    @IBAction func answer2Touch(_ sender: Any) {
        answer2.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
        answer2.layer.borderWidth = 2.0
        if (currentAnswer == 1) {
            answer1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer1.layer.borderWidth = 0.0
        } else if (currentAnswer == 3) {
            answer3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer3.layer.borderWidth = 0.0
        } else if (currentAnswer == 4) {
            answer4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer4.layer.borderWidth = 0.0
        }
        currentAnswer = 2
        currentAnswerText = answer2.currentTitle!
    }
    @IBOutlet weak var answer3: UIButton!
    @IBAction func answer3Touch(_ sender: Any) {
        answer3.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
        answer3.layer.borderWidth = 2.0
        if (currentAnswer == 1) {
            answer1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer1.layer.borderWidth = 0.0
        } else if (currentAnswer == 2) {
            answer2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer2.layer.borderWidth = 0.0
        } else if (currentAnswer == 4) {
            answer4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer4.layer.borderWidth = 0.0
        }
        currentAnswer = 3
        currentAnswerText = answer3.currentTitle!
    }
    @IBOutlet weak var answer4: UIButton!
    @IBAction func answer4Touch(_ sender: Any) {
        answer4.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7846777613, blue: 0.7427274138, alpha: 1)
        answer4.layer.borderWidth = 2.0
        if (currentAnswer == 1) {
            answer1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer1.layer.borderWidth = 0.0
        } else if (currentAnswer == 2) {
            answer2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer2.layer.borderWidth = 0.0
        } else if (currentAnswer == 3) {
            answer3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            answer3.layer.borderWidth = 0.0
        }
        currentAnswer = 4
        currentAnswerText = answer4.currentTitle!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        for i in 0..<quizData.count {
            let tempTitle = quizData[i].title
            if (tempTitle == getQuiz) {
                currentQuizNumber = i
            }
        }
        questionText.text = quizData[currentQuizNumber].questions[currentQuestion].text
        answer1.setTitle(quizData[currentQuizNumber].questions[currentQuestion].answers[0], for: .normal)
        answer2.setTitle(quizData[currentQuizNumber].questions[currentQuestion].answers[1], for: .normal)
        answer3.setTitle(quizData[currentQuizNumber].questions[currentQuestion].answers[2], for: .normal)
        answer4.setTitle(quizData[currentQuizNumber].questions[currentQuestion].answers[3], for: .normal)
        correctAnswer = Int(quizData[currentQuizNumber].questions[currentQuestion].answer)!
        correctAnswerText = quizData[currentQuizNumber].questions[currentQuestion].answers[correctAnswer - 1]
        currentQuiz = getQuiz
        currentQuestion = currentQuestion + 1
    }
}
