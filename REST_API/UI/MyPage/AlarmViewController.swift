//
//  AlarmViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/22.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var alarmTableView: UITableView!
    
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
        
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        
        navigationItem.title = "알람 설정"
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    
}

extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        
        case 0:
            let cell = alarmTableView.dequeueReusableCell(withIdentifier: "pushcell", for: indexPath)
            cell.textLabel?.text = "푸시 알림"
            cell.detailTextLabel?.text = "ON"
            return cell
            
        case 1:
            let cell = alarmTableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! AlarmTableViewCell
            cell.pushLabel.text = "광고성 정보 수신 동의"
            return cell
            
        default:
            let cell = alarmTableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! AlarmTableViewCell
            cell.pushLabel.text = "야간 수신 동의"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 30))
        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        return v
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(x: 50, y:50, width: tableView.frame.width, height: 30))
        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        if(section == 0) {
            let footerLabel = UILabel(frame: v.bounds)
            footerLabel.translatesAutoresizingMaskIntoConstraints = false
            footerLabel.text = "마켓컬리 앱에서 보내는 알림을 받을 수 있습니다. 알림에 관한 설정은 \n '설정앱>알림>마켓멀리'에서 변경할 수 있습니다."
            footerLabel.textAlignment = .left
            footerLabel.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            footerLabel.textColor = .lightGray
            footerLabel.numberOfLines = 0
            
            v.addSubview(footerLabel)
        }
        
        else if (section == 1) {
            let footerLabel = UILabel(frame: v.bounds)
            footerLabel.translatesAutoresizingMaskIntoConstraints = false
            footerLabel.text = "신규 서비스 및 고객 맞춤 혜택 정보를 받을 수 있습니다."
            footerLabel.textAlignment = .left
            footerLabel.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            footerLabel.textColor = .lightGray
            footerLabel.numberOfLines = 0
            
            v.addSubview(footerLabel)
        }
        
        else {
            let footerLabel = UILabel(frame: v.bounds)
            footerLabel.translatesAutoresizingMaskIntoConstraints = false
            footerLabel.text = "야간(오후9시 ~ 오전8시)에 알림을 받을 수 있습니다."
            footerLabel.textAlignment = .left
            footerLabel.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            footerLabel.textColor = .lightGray
            footerLabel.numberOfLines = 0
            
            v.addSubview(footerLabel)
            
        }
        
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 10.0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 60.0
        case 1:
            return 30.0
        default:
            return 440.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 0) {
            
            print("++++++++")
            
        }
        
    }
    
}
