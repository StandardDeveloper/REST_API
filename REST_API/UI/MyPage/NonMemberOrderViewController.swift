//
//  NonMemberOrderViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/02.
//

import UIKit

class NonMemberOrderViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var oderNumberTextField: UITextField!
    @IBOutlet weak var oderConfirmBtn: UIButton!
    
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

        setupNavgation()
        configrationUI()
    }
    
    func setupNavgation() {
        
        navigationItem.title = "비회원 주문 조회"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    func configrationUI() {
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        oderNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        oderNumberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        oderNumberTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        oderNumberTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        oderNumberTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        oderConfirmBtn.translatesAutoresizingMaskIntoConstraints = false
        oderConfirmBtn.topAnchor.constraint(equalTo: oderNumberTextField.bottomAnchor, constant: 20).isActive = true
        oderConfirmBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        oderConfirmBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        oderConfirmBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        oderConfirmBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        oderConfirmBtn.backgroundColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
        oderConfirmBtn.layer.borderColor = UIColor.purple.cgColor
        oderConfirmBtn.layer.cornerRadius = 5

    }
    
}
