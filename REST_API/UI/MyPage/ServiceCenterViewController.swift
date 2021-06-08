//
//  ServiceCenterViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/08.
//

import UIKit

class ServiceCenterViewController: UIViewController {
    
    @IBOutlet weak var serviceTableView: UITableView!
    var naviTitle : String = ""
    
    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .lightGray
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
      }

    override func viewDidLoad() {
        super.viewDidLoad()

        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        
        configNavigation()
    }
    
    func configNavigation() {
        
        navigationItem.title = naviTitle
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton

    }
}

extension ServiceCenterViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Section 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //section안에 Cell 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Section 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0) {
            let serviceCenterCell = serviceTableView.dequeueReusableCell(withIdentifier: "serviceCenterCell", for: indexPath) as! MyPageServiceCenterTableViewCell
            return serviceCenterCell
        }
        
        else {
            let serviceCenterCell2 = serviceTableView.dequeueReusableCell(withIdentifier: "serviceCenterCell2", for: indexPath) as! MyPageService2TableViewCell
            return serviceCenterCell2
        }
    }
    
    //Section 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.section == 0) {
            return 280.0
        }
        else {
            return 155.0
        }
    }
    
    //Section header 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    //Headr Seciont 색상 변경
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 10.0))
        headerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        return headerView
    }
}
