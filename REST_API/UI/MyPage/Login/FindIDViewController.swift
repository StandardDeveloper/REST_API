//
//  FindIDViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/09.
//

import UIKit
import Moya
import ProgressHUD

class FindIDViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var findIDBtn: UIButton!
    
    let provider = MoyaProvider<AuthAPI>()
    
    
    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationSetup()
        configSetup()
    }
    
    func navigationSetup() {
        
        navigationItem.title = "아이디 찾기"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    func configSetup() {
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        findIDBtn.translatesAutoresizingMaskIntoConstraints = false
        findIDBtn.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        findIDBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        findIDBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        findIDBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findIDBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        findIDBtn.backgroundColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
        findIDBtn.layer.cornerRadius = 5
    }
    
    @IBAction func findIDBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "사용자정보가 존재하지 않습니다",
                                                message: "",
                                                preferredStyle: UIAlertController.Style.alert)
        let alertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(alertOK)
        
        if(nameTextField.text == "" && emailTextField.text == "") {
            self.present(alertController, animated: true, completion: nil)
        }
        else {

        }
    }
    
}
