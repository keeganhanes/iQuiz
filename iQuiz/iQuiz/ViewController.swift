//
//  ViewController.swift
//  iQuiz
//
//  Created by Keegan Hanes on 2/22/19.
//  Copyright © 2019 Keegan Hanes. All rights reserved.
//

import UIKit

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
    //var data : [String] = ["Mathmatics", "Marvel Super Heros", "Science"]
    var data : [Subject] = [Subject(title: "Mathmatics", description: "Math related qestions :(", image: UIImage(named: "calculator")!), Subject(title: "Marvel Super Heros", description: "Questions from the Marvel Universe", image: UIImage(named: "marvel")!), Subject(title: "Science", description: "Test your science skills!", image: UIImage(named: "test_tube")!)]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        assert(section == 0)
        return "Quiz Subjects"
    }
    
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
    @IBAction func settingsBtnTouch(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "This is where settings go", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    var dataSource : QuizSubjectDataSource? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = QuizSubjectDataSource()
        quizTableView.dataSource = dataSource
        quizTableView.delegate = self
    }


}

