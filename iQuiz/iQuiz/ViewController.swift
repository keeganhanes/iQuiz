//
//  ViewController.swift
//  iQuiz
//
//  Created by Keegan Hanes on 2/22/19.
//  Copyright © 2019 Keegan Hanes. All rights reserved.
//

import UIKit

var question = ""
var answers : [String] = []
var data : [Subject] = []
var baseURL = "http://tednewardsandbox.site44.com/questions.json"

class Subject {
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.icon = image
    }
    var title = ""
    var description = ""
    var icon = UIImage(named: "")
}

class QuizSubjectDataSource : NSObject, UITableViewDataSource {
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        assert(section == 0)
        return "Quiz Subjects"
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        cell.textLabel?.text = data[indexPath.row].title
        cell.imageView?.image = data[indexPath.row].icon
        cell.detailTextLabel?.text = data[indexPath.row].description
        return cell
    }
}

class ViewController: UIViewController, UITableViewDelegate {
   
    @IBOutlet weak var quizTableView: UITableView!
    @IBOutlet var popOver: UIView!
    @IBAction func checkNowTouch(_ sender: Any) {
        self.popOver.removeFromSuperview()
    }
    @IBAction func settingsBtnTouch(_ sender: Any) {
        self.view.addSubview(popOver)
        popOver.center = self.view.center
        /*
        let alert = UIAlertController(title: "Settings", message: "This is where settings go", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        */
    }

    
    var dataSource : QuizSubjectDataSource? = nil
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let questionVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        questionVC.getQuiz = data[indexPath.row].title
        self.navigationController?.pushViewController(questionVC, animated: true)
    }
    
    func getJsonFromUrl() {
        let url = NSURL(string: baseURL)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "questions")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if let questionArray = jsonObj!.value(forKey: "questions") as? NSArray {
                    //looping through all the elements
                    for question in questionArray{
                        
                        //converting the element to a dictionary
                        if let questionDict = question as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = questionDict.value(forKey: "name") {
                                
                                //adding the name to the array
                                self.nameArray.append((name as? String)!)
                            }
                            
                        }
                    }
                }
            }
        }).resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFromUrl()
        self.popOver.layer.cornerRadius = 10
        self.navigationItem.hidesBackButton = true
        dataSource = QuizSubjectDataSource()
        quizTableView.dataSource = dataSource
        quizTableView.delegate = self
        data = [Subject(title: "Mathematics", description: "Math related qestions :(", image: UIImage(named: "calculator")!), Subject(title: "Marvel Super Heros", description: "Questions from the Marvel Universe", image: UIImage(named: "marvel")!), Subject(title: "Science", description: "Test your science skills!", image: UIImage(named: "test_tube")!)]
    }
}

