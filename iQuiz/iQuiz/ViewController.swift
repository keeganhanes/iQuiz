//
//  ViewController.swift
//  iQuiz
//
//  Created by Keegan Hanes on 2/22/19.
//  Copyright © 2019 Keegan Hanes. All rights reserved.
//

import UIKit

var quizData : [Subject] = []
var baseURL = "http://tednewardsandbox.site44.com/questions.json"
var titleArray : [String] = []
var descriptionArray : [String] = []
var textArray : [String] = []
var answerArray : [String] = []
var answersArray : [[String]] = [[]]

class Subject {
    init(title: String, description: String, image: UIImage, questions: [Question]) {
        self.title = title
        self.description = description
        self.icon = image
        self.questions = questions
    }
    var title = ""
    var description = ""
    var icon = UIImage(named: "")
    var questions = [Question(text: "", answer: "", answers: [])]
}

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

class QuizSubjectDataSource : NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        cell.textLabel?.text =  quizData[indexPath.row].title
        cell.imageView?.image = quizData[indexPath.row].icon
        cell.detailTextLabel?.text = quizData[indexPath.row].description
        return cell
    }
}

class ViewController: UIViewController, UITableViewDelegate {
   
    @IBOutlet weak var quizTableView: UITableView!
    @IBOutlet var popOver: UIView!
    @IBAction func checkNowTouch(_ sender: Any) {
        quizData = []
        getJsonFromUrl()
        self.popOver.removeFromSuperview()
    }
    
    
    @IBAction func settingsBtnTouch(_ sender: Any) {
        self.view.addSubview(popOver)
        popOver.center = self.view.center
    }
    
    var dataSource : QuizSubjectDataSource? = nil

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let questionVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        questionVC.getQuiz = quizData[indexPath.row].title
        self.navigationController?.pushViewController(questionVC, animated: true)
    }
    
    
    func getJsonFromUrl() {
        guard let url = URL(string: baseURL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true, completion: nil)
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                guard let subjectArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                var imageString = ""
                for subject in subjectArray {
                    textArray = []
                    answerArray = []
                    answersArray = []
                    guard let subjectTitle = subject["title"] as? String else { return }
                    titleArray.append(subjectTitle)
                    guard let subjectDescription = subject["desc"] as? String else { return }
                    descriptionArray.append(subjectDescription)
                    guard let questionArray = subject["questions"] as? [[String: Any]] else { return }
                    for question in questionArray {
                        guard let questionText = question["text"] as? String else { return }
                        textArray.append(questionText)
                        guard let questionAnswer = question["answer"] as? String else { return }
                        answerArray.append(questionAnswer)
                        guard let questionAnswers = question["answers"] as? [String] else { return }
                        answersArray.append(questionAnswers)
                    }
                    var tempQuestionsArray : [Question] = []
                    for i in 0..<textArray.count {
                        let tempQuestion = Question(text: textArray[i], answer: answerArray[i], answers: answersArray[i])
                        tempQuestionsArray.append(tempQuestion)
                    }
                    if (subjectTitle == "Mathematics") {
                        imageString = "calculator"
                    } else if (subjectTitle == "Marvel Super Heroes") {
                        imageString = "marvel"
                    } else if (subjectTitle == "Science!"){
                        imageString = "test_tube"
                    } else {
                        imageString = "questionMark"
                    }
                    let newSubject = Subject(title: subjectTitle, description: subjectDescription, image: UIImage(named: imageString)!, questions: tempQuestionsArray)
                    quizData.append(newSubject)
                }
                DispatchQueue.main.async {
                    self.quizTableView.reloadData()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popOver.layer.cornerRadius = 10
        self.navigationItem.hidesBackButton = true
        dataSource = QuizSubjectDataSource()
        quizTableView.dataSource = dataSource
        quizTableView.delegate = self
    }
}

