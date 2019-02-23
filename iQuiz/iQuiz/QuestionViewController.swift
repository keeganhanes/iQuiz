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

let scienceQuestions : [Question] = [Question(text: "What is fire", answer: "1", answers: ["One of the four classical elements", "A magical reaction given to us by God", "A band that hasn't yet been discovered", "Fire! Fire! Fire! heh-heh"])]
let marvelQuestions : [Question] = [Question(text: "Who is Iron Man?", answer: "1", answers: ["Tony Stark", "Obadiah Stane", "A rock hit by Megadeth", "Nobody knows"]), Question(text: "Who founded the X-Men?", answer: "2", answers: ["Tony Stark", "Professor X", "The X-Institute", "Erik Lensherr"]), Question(text: "How did Spider-Man get his powers?", answer: "1", answers: ["He was bitten by a radioactive spider", "He ate a radioactive spider", "He is a radioactive spider", "He looked at a radioactive spider"])]
let mathQuestions : [Question] = [Question(text: "What is 2+2?", answer: "1", answers: ["4", "22", "An irrational number", "Nobody knows"])]

class Question {
    init(text: String, answer: String, answers: [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
    var text = ""
    var answer = ""
    var answers = [""]
}

class Form {
    init(title: String, desc: String, question: [Question]) {
        self.title = title
        self.desc = desc
        self.question = question
    }
    var title = ""
    var desc = ""
    var question = ["", "", [""]] as [Any]
}

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
            self.navigationController?.pushViewController(answerVC, animated: true)
        }
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
        if (getQuiz == "Mathmatics") {
            questionText.text = mathQuestions[0].text
            answer1.setTitle(mathQuestions[0].answers[0], for: .normal)
            answer2.setTitle(mathQuestions[0].answers[1], for: .normal)
            answer3.setTitle(mathQuestions[0].answers[2], for: .normal)
            answer4.setTitle(mathQuestions[0].answers[3], for: .normal)
            correctAnswer = Int(mathQuestions[0].answer)!
            correctAnswerText = mathQuestions[0].answer
        } else if (getQuiz == "Marvel Super Heros") {
            questionText.text = marvelQuestions[0].text
            answer1.setTitle(marvelQuestions[0].answers[0], for: .normal)
            answer2.setTitle(marvelQuestions[0].answers[1], for: .normal)
            answer3.setTitle(marvelQuestions[0].answers[2], for: .normal)
            answer4.setTitle(marvelQuestions[0].answers[3], for: .normal)
            correctAnswer = Int(marvelQuestions[0].answer)!
            correctAnswerText = marvelQuestions[0].answer
        } else if (getQuiz == "Science") {
            questionText.text = scienceQuestions[0].text
            answer1.setTitle(scienceQuestions[0].answers[0], for: .normal)
            answer2.setTitle(scienceQuestions[0].answers[1], for: .normal)
            answer3.setTitle(scienceQuestions[0].answers[2], for: .normal)
            answer4.setTitle(scienceQuestions[0].answers[3], for: .normal)
            correctAnswer = Int(scienceQuestions[0].answer)!
            correctAnswerText = scienceQuestions[0].answer
        } else {
            questionText.text = "Quiz unavailable"
        }
    }
}
