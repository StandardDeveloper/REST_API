//
//  SignupViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/18.
//

import UIKit
import Moya
import SwiftyJSON
import ProgressHUD

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextlabel: UILabel!
    @IBOutlet weak var emailTextlabel: UILabel!
    @IBOutlet weak var pwTextlabel: UILabel!
    @IBOutlet weak var addressTextlabel: UILabel!
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfiled: UITextField!
    @IBOutlet weak var confirmPWTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    let provider = MoyaProvider<AuthAPI>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProgressHUD.animationType = .circleRotateChase
        ProgressHUD.colorAnimation = .darkGray
        
        configureSignupViewComponet()

    }
    
    func configureSignupViewComponet() {
    
        nameTextlabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextlabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextlabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextlabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        nameTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        nameTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        emailTextlabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextlabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextlabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextlabel.topAnchor.constraint(equalTo: nameTextlabel.bottomAnchor, constant: 10).isActive = true
        emailTextlabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        emailTextfield.translatesAutoresizingMaskIntoConstraints = false
        emailTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        emailTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 10).isActive = true
        emailTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        pwTextlabel.translatesAutoresizingMaskIntoConstraints = false
        pwTextlabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pwTextlabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pwTextlabel.topAnchor.constraint(equalTo: emailTextlabel.bottomAnchor, constant: 10).isActive = true
        pwTextlabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        pwTextfiled.translatesAutoresizingMaskIntoConstraints = false
        pwTextfiled.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        pwTextfiled.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pwTextfiled.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 10).isActive = true
        pwTextfiled.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        confirmPWTextfield.translatesAutoresizingMaskIntoConstraints = false
        confirmPWTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        confirmPWTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmPWTextfield.topAnchor.constraint(equalTo: pwTextfiled.bottomAnchor, constant: 10).isActive = true
        confirmPWTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true

        addressTextlabel.translatesAutoresizingMaskIntoConstraints = false
        addressTextlabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addressTextlabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addressTextlabel.topAnchor.constraint(equalTo: confirmPWTextfield.bottomAnchor, constant: 10).isActive = true
        addressTextlabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        addressTextfield.translatesAutoresizingMaskIntoConstraints = false
        addressTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        addressTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addressTextfield.topAnchor.constraint(equalTo: confirmPWTextfield.bottomAnchor, constant: 10).isActive = true
        addressTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.layer.cornerRadius = 5
        signupBtn.topAnchor.constraint(equalTo: addressTextfield.bottomAnchor, constant: 30).isActive = true
        signupBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        signupBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        signupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signupBtn.backgroundColor = .black

    }
    @IBAction func signupBtn(_ sender: Any) {
        
        ProgressHUD.show()
        
        if(nameTextfield.text == "") {
        
            let Alertvc = UIAlertController(title: "이름 입력 오류", message: "", preferredStyle: UIAlertController.Style.alert)
            let AlertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
            Alertvc.addAction(AlertOK)
            self.present(Alertvc, animated: true, completion: nil)
            
            ProgressHUD.dismiss()
            
        }
        else if (emailTextfield.text == "") {
            
            let Alertvc = UIAlertController(title: "이메일 입력 오류", message: "", preferredStyle: UIAlertController.Style.alert)
            let AlertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
            Alertvc.addAction(AlertOK)
            self.present(Alertvc, animated: true, completion: nil)
            
            ProgressHUD.dismiss()
        }
        else if (pwTextfiled.text == "") {
            
            let Alertvc = UIAlertController(title: "비밀번호 입력 오류", message: "", preferredStyle: UIAlertController.Style.alert)
            let AlertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
            Alertvc.addAction(AlertOK)
            self.present(Alertvc, animated: true, completion: nil)
            
            ProgressHUD.dismiss()
        }
        
        else {
        
            ProgressHUD.show()
            
            provider.request(.signup(name: nameTextfield.text!, email: emailTextfield.text!, password: pwTextfiled.text!)) { [self] response in
                
                switch response {
                
                case .success(let res):
                    let jsonData = JSON(res.data)
                    
                    if(res.statusCode != 200) {
                        
                        print("+++++++++++", nameTextfield.text, emailTextfield.text, pwTextfiled.text)
                        print("**********", res.statusCode)
                        
                        ProgressHUD.dismiss()
                        
                    }
                    else {
                        
                        let Alertvc = UIAlertController(title: emailTextfield.text! + "로 메일을 보냈습니다", message: "인증 해주세요", preferredStyle: .actionSheet)
                        
                        let AlertOK = UIAlertAction(title: "로그인 화면 이동", style: .cancel) { (action) in
                            
                            let mainvc = self.storyboard?.instantiateViewController(withIdentifier: "loginvc")

                            self.navigationController?.pushViewController(mainvc!, animated: true)
                            
                        }
                        
                        Alertvc.addAction(AlertOK)
                        self.present(Alertvc, animated: true, completion: nil)
                        
                        ProgressHUD.dismiss()
                        
                    }
                    
                case .failure(let err):
                    ProgressHUD.dismiss()
                    print(err)
                
                }
                
            }
        
        }
    
    }
    
}
