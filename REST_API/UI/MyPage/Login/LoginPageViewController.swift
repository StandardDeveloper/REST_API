//
//  LoginPageViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/18.
//

import UIKit
import Moya
import SwiftyJSON
import ProgressHUD
import FBSDKLoginKit
import Alamofire
import NotificationBannerSwift
import BRYXBanner

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var findIDBtn: UIButton!
    @IBOutlet weak var findPWBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var partitionView: UIView!
    @IBOutlet weak var loginTypeTextlabel: UILabel!
    @IBOutlet weak var partitionView3: UIView!
    @IBOutlet weak var partitionView2: UIView!
    @IBOutlet weak var facebookLoginBtn: UIButton!
    
    
    let provider = MoyaProvider<AuthAPI>()
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.animationType = .circleRotateChase
        ProgressHUD.colorAnimation = .darkGray
        
        configrationUI()
    }
    
    func configrationUI() {
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        idTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        idTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10).isActive = true
        pwTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        pwTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        pwTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pwTextField.isSecureTextEntry = true
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.layer.cornerRadius = 5
        loginBtn.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 20).isActive = true
        loginBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        loginBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginBtn.backgroundColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
        loginBtn.layer.borderWidth = 1
        
        findIDBtn.translatesAutoresizingMaskIntoConstraints = false
        findIDBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        findIDBtn.rightAnchor.constraint(equalTo: partitionView.leftAnchor, constant: -20).isActive = true
        findIDBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findIDBtn.tintColor = .darkGray
        
        partitionView.translatesAutoresizingMaskIntoConstraints = false
        partitionView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        partitionView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30).isActive = true
        partitionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        partitionView.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        findPWBtn.translatesAutoresizingMaskIntoConstraints = false
        findPWBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        findPWBtn.leftAnchor.constraint(equalTo: partitionView.leftAnchor, constant: 20).isActive = true
        findPWBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findPWBtn.tintColor = .darkGray
        
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.layer.cornerRadius = 5
        signupBtn.topAnchor.constraint(equalTo: partitionView.bottomAnchor, constant: 30).isActive = true
        signupBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        signupBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        signupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupBtn.setTitleColor(UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0), for: UIControl.State.normal)
        signupBtn.backgroundColor = .white
        signupBtn.layer.borderColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0).cgColor
        signupBtn.layer.borderWidth = 1
        
        partitionView2.translatesAutoresizingMaskIntoConstraints = false
        partitionView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        partitionView2.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 100).isActive = true
        partitionView2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        partitionView2.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        loginTypeTextlabel.translatesAutoresizingMaskIntoConstraints = false
        loginTypeTextlabel.font = UIFont.italicSystemFont(ofSize: 13)
        loginTypeTextlabel.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 93).isActive = true
        loginTypeTextlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        partitionView3.translatesAutoresizingMaskIntoConstraints = false
        partitionView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        partitionView3.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 100).isActive = true
        partitionView3.leftAnchor.constraint(equalTo: loginTypeTextlabel.rightAnchor, constant: 10).isActive = true
        partitionView3.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        facebookLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookLoginBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        facebookLoginBtn.topAnchor.constraint(equalTo: loginTypeTextlabel.bottomAnchor, constant: 20).isActive = true
        facebookLoginBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        provider.request(.login(email: idTextField.text!, password: pwTextField.text!)) { (response) in
            
            switch response {
            
            case .success(let res):
                if(res.statusCode != 200) {
                    
                    let banner = Banner(title: "", subtitle: "아이디, 비밀번호 확인해주세요.", image: UIImage(named: "Icon"), backgroundColor: UIColor(red:255.0/255.0, green:222.0/255.0, blue:230.0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.textColor = UIColor(red:160.0/255.0, green:8.0/255.0, blue:8.0/255.0, alpha:1.000)
                    banner.show(duration: 2.0)
                    
                }
                else {
                    let jsonData = JSON(res.data)
                    let tokenInfo = jsonData["token"].string!
                    UserDefaults.standard.set(tokenInfo, forKey: "token")
                    print("++++Token++++", tokenInfo )
                    self.dismiss(animated: true, completion: nil)
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func facebookLoginBtn(_ sender: Any) {
        
        let fbLoginManager = LoginManager()
        
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { [self] result, error in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            guard let accessToken = AccessToken.current else {
                print("failed to get accessToken")
                return
            }
            
            print("++++++++++", accessToken.tokenString)
            
            //Alamofire
            //            AF.request("http://localhost:3000/users/facebook", method: .get, parameters: ["access_token": accessToken.tokenString]).responseJSON { response in
            //
            //                            switch response.result {
            //
            //                            case .success(let data):
            //                                print("++++++++++++++++", data)
            //                                break
            //                            case .failure(let err):
            //                                print("----------", err)
            //                                break
            //                            }
            //
            //                        }
            
            //Moya
            //            provider.request(.facebookLogin(token: accessToken.tokenString)) { response in
            //
            //                switch response {
            //
            //                case .success(let data):
            //                    let jsonData = JSON(data.data)
            //                    print("+++++++++++",jsonData)
            //                    break
            //
            //                case .failure(let err):
            //                    print(err)
            //                    break
            //                }
            //
            //
            //            }
            
            
        }
    }
    
}
