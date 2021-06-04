//
//  FavoriteProductViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/28.
//

import UIKit

class FavoriteProductViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var bestProductBtn: UIButton!
    
    var navTitle: String? = ""
    
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
    
    lazy var shoppingButton: UIBarButtonItem = {
        let buttonIcon = UIImage(named: "outline_shopping_cart_white_36pt")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(rightBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func rightBtn(_ sender:UIBarButtonItem!)
      {
        
      }
    
    lazy var mapButton: UIBarButtonItem = {
        let buttonIcon = UIImage(named: "outline_location_on_white_36pt")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(mapBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func mapBtn(_ sender:UIBarButtonItem!){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavgation(navTitle: navTitle!)
        configView()
    }
    
    func setupNavgation(navTitle: String) {
    
        navigationItem.title = navTitle
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
        navigationItem.rightBarButtonItems = [shoppingButton, mapButton]
    }
    
    func configView(){
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        bestProductBtn.translatesAutoresizingMaskIntoConstraints = false
        bestProductBtn.layer.cornerRadius = 20
        bestProductBtn.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        //bestProductBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bestProductBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bestProductBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        bestProductBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -120).isActive = true
        bestProductBtn.setTitleColor(UIColor.purple, for: UIControl.State.normal)
        bestProductBtn.backgroundColor = .white
        bestProductBtn.layer.borderColor = UIColor.purple.cgColor
        bestProductBtn.layer.borderWidth = 2
        
    }
    
    //이동하는 방법 물어보기!
    @IBAction func moveBestProductPage(_ sender: Any) {
        
        tabBarController?.selectedIndex = 0

//        let homeSB = UIStoryboard(name: "Home", bundle: nil)
//        let homeBestVC = homeSB.instantiateViewController(withIdentifier: "bestVC")
//        navigationController?.pushViewController(homeBestVC, animated: true)
    }
    
}
