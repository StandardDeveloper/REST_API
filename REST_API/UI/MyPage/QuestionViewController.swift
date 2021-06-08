//
//  QuestionViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/08.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionTableView: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionTableView.delegate = self
        questionTableView.dataSource = self
    }
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = questionTableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! MyPageQuestionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 10.0))
        headerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        return headerView
    }
    
}
