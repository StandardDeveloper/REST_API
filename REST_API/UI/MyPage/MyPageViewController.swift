//
//  MyPageViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/18.
//

import UIKit
import Moya
import SwiftyJSON
import Kingfisher
import XLActionController
import NotificationBannerSwift

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var myPageTableView: UITableView!
    
    var logoutInfoTitle = ["비회원 주문 조회", "배송안내", "공지사항", "자주하는 질문", "고객센터", "이용안내", "컬리소개", "알람 설정" ]
    var loginInfoTitle_1 = ["적립금", "쿠폰", "친구초대"]
    var loginInfoTitle_2 = ["주문내역", "배송지 관리", "상품 후기", "상품 문의", "1:1 문의", "대량주문 문의"]
    var loginInfoTitle_3 = ["배송안내", "공지사항", "자주하는 질문", "고객센터", "이용안내", "컬리소개", "컬리패스" ]
    var loginInfoTitle_4 = ["개인정보 수정", "알림 설정"]
    var tokenFlag = false
    
    var networkProvider = AuthNetworkManager()
    let provider = MoyaProvider<AuthAPI>()
    let token = UserDefaults.standard.string(forKey: "token")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageTableView.dataSource = self
        myPageTableView.delegate = self
        
        myPageTableView.estimatedRowHeight = myPageTableView.rowHeight
        myPageTableView.rowHeight = UITableView.automaticDimension
        myPageTableView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        
        let token = UserDefaults.standard.string(forKey: "token")
        self.navigationController?.navigationBar.isOpaque = true
        self.tabBarController?.tabBar.isOpaque = true
        
        if( token != "" && token != nil) {
            tokenFlag = true
            OperationQueue.main.addOperation {
                self.myPageTableView.reloadData()
            }
        }
        else {
            tokenFlag = false
            OperationQueue.main.addOperation {
                self.myPageTableView.reloadData()
            }
        }
    }
    
    @IBAction func moveLoginPage(_ sender: Any) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        let loginpageVC = mainSB.instantiateViewController(withIdentifier: "loginpagevc")
        
        loginpageVC.modalPresentationStyle = .fullScreen
        
        present(loginpageVC, animated: true, completion: nil)
    }
    
    
}

extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //로그인 안되어있는 경우
        if(tokenFlag == false) {
            return 4
        }
        
        //로그인 되어 있는 경우
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if( tokenFlag == false) {
            
            switch section {
            
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return 6
            default:
                return 1
            }
        }
        else {
            
            switch section {
            
            case 0:
                return 1
            case 1:
                return loginInfoTitle_1.count
            case 2:
                return loginInfoTitle_2.count
            case 3:
                return loginInfoTitle_3.count
            case 4:
                return loginInfoTitle_4.count
            default:
                return 1
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //로그아웃 상태
        if( tokenFlag == false) {
            
            myPageTableView.rowHeight = 60
            let infoCell = myPageTableView.dequeueReusableCell(withIdentifier: "infocell", for: indexPath)
            
            switch indexPath.section {
            
            case 0:
                myPageTableView.rowHeight = 200
                let cell = myPageTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyPageCustomTableViewCell
                return cell
                
            case 1:
                infoCell.textLabel?.text = logoutInfoTitle[indexPath.row]
                
            case 2:
                infoCell.textLabel?.text = logoutInfoTitle[indexPath.row + 1]
                
            default:
                infoCell.textLabel?.text = logoutInfoTitle[logoutInfoTitle.count - 1]
                
            }
            
            return infoCell
        }
        //로그인 상태
        else {
            myPageTableView.rowHeight = 60
            let infoCell = myPageTableView.dequeueReusableCell(withIdentifier: "infocell", for: indexPath)
            
            switch indexPath.section {
            
            case 0:
                myPageTableView.rowHeight = 150
                
                let cell = myPageTableView.dequeueReusableCell(withIdentifier: "logincell", for: indexPath) as! LoginTableViewCell
                
                if(token != nil) {
                    
                    networkProvider.getProfile(token: String(token!)) {  results in
                        cell.userNameLabel.text = results.name
                        let imageURL = URL(string: results.avatar)
                        cell.profileImageView.kf.setImage(with: imageURL)
                        cell.emailLabel.text = results.email
                    }
                }
                
                return cell
                
            case 1:
                infoCell.textLabel?.text = loginInfoTitle_1[indexPath.row]
            case 2:
                infoCell.textLabel?.text = loginInfoTitle_2[indexPath.row]
            case 3:
                infoCell.textLabel?.text = loginInfoTitle_3[indexPath.row]
            case 4:
                infoCell.textLabel?.text = loginInfoTitle_4[indexPath.row]
            default:
                infoCell.textLabel?.text = "로그아웃"
            }
            
            return infoCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 0
        default:
            return 15.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 30))
        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        let button = UIButton(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 30))
        v.addSubview(button)
        button.backgroundColor = .blue
        return v
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //로그인 되어있는 경우
        if(tokenFlag == true) {
            
            if(indexPath.section == 5) {
                
                let actionController = YoutubeActionController()
                actionController.addAction(Action(ActionData(title: "로그아웃", image: UIImage(systemName: "arrowshape.turn.up.backward.fill")!), style: .default, handler: { action in
                    
                    UserDefaults.standard.set("", forKey: "token")
                    self.viewWillAppear(true)
                    
                }))
                
                actionController.addAction(Action(ActionData(title: "취소"), style: .cancel, handler: { action in
                    
                }))
                
                present(actionController, animated: true, completion: nil)
            }
        }
        //로그아웃 경우
        else {
            switch indexPath.section {
            case 1:
                let nonMemberOderVC = self.storyboard?.instantiateViewController(identifier: "nonMemberOderVC") as! NonMemberOrderViewController
                self.navigationController?.pushViewController(nonMemberOderVC, animated: true)
                break
            //배송안내
            case 2:
                if(indexPath.row != 3) {
                    let mainSB = UIStoryboard(name: "Main", bundle: nil)
                    let webVC = mainSB.instantiateViewController(withIdentifier: "webviewvc") as! WebViewController
                    self.navigationController?.pushViewController(webVC, animated: true)
                    if(indexPath.row == 0) {
                        webVC.navTitle = "배송 안내"
                    }
                    else if(indexPath.row == 1) {
                        webVC.navTitle = "공지사항"
                    }
                    else if(indexPath.row == 2) {
                        webVC.navTitle = "자주하는 질문"
                    }
                    else if(indexPath.row == 3) {
                        webVC.navTitle = "고객센터"
                    }
                    else if (indexPath.row == 4) {
                        webVC.navTitle = "이용안내"
                    }
                    else {
                        webVC.navTitle = "컬리소개"
                    }
                    
                }
            //                switch indexPath.row {
            //                case 5:
            //                    let mainSB = UIStoryboard(name: "Main", bundle: nil)
            //                    let webVC = mainSB.instantiateViewController(withIdentifier: "webviewvc") as! WebViewController
            //                    self.navigationController?.pushViewController(webVC, animated: true)
            //                    webVC.navTitle = logoutInfoTitle[indexPath.row+1]
            //                    break
            //                default:
            //                    break
            //                }
            
            //알람
            case 3:
                switch indexPath.row {
                case 0:
                    let alarmVC = self.storyboard!.instantiateViewController(withIdentifier: "alarmvc")
                    navigationController?.pushViewController(alarmVC, animated: true)
                default:
                    break
                }
                
                
            default:
                print("")
            }
        }
    }
}
